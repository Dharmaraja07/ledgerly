import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/models/document_isar.dart';
import '../bloc/document_vault_bloc.dart';
import '../widgets/document_card.dart';
import '../widgets/document_filter_chips.dart';
import '../widgets/storage_summary_card.dart';
import '../../../../core/theme/app_theme.dart';

class DocumentVaultScreen extends StatefulWidget {
  const DocumentVaultScreen({super.key});

  @override
  State<DocumentVaultScreen> createState() => _DocumentVaultScreenState();
}

class _DocumentVaultScreenState extends State<DocumentVaultScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<DocumentVaultBloc>().add(const LoadDocuments());
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Vault'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
            Tab(text: 'Documents', icon: Icon(Icons.folder)),
            Tab(text: 'Search', icon: Icon(Icons.search)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<DocumentVaultBloc>().add(const RefreshDocuments());
            },
          ),
        ],
      ),
      body: BlocConsumer<DocumentVaultBloc, DocumentVaultState>(
        listenWhen: (previous, current) =>
            current.status == DocumentVaultStatus.failure &&
            current.errorMessage != null &&
            current.documents.isNotEmpty,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        builder: (context, state) {
          if (state.status == DocumentVaultStatus.loading && state.documents.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == DocumentVaultStatus.failure && state.documents.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading documents',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.errorMessage ?? 'Unknown error',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<DocumentVaultBloc>().add(const LoadDocuments());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildOverviewTab(state),
              _buildDocumentsTab(state),
              _buildSearchTab(state),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMenu,
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildOverviewTab(DocumentVaultState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StorageSummaryCard(
            totalDocuments: state.totalDocuments,
            totalStorageUsed: state.formattedStorageUsed,
            categories: state.categories.length,
            tags: state.tags.length,
            expiringCount: state.expiringDocuments.length,
            expiredCount: state.expiredDocuments.length,
          ),
          const SizedBox(height: 24),
          _buildDocumentTypeBreakdown(state),
          const SizedBox(height: 24),
          _buildRecentDocuments(state),
          const SizedBox(height: 24),
          if (state.expiringDocuments.isNotEmpty) ...[
            _buildExpiringDocuments(state),
            const SizedBox(height: 24),
          ],
          if (state.expiredDocuments.isNotEmpty) ...[
            _buildExpiredDocuments(state),
          ],
        ],
      ),
    );
  }

  Widget _buildDocumentTypeBreakdown(DocumentVaultState state) {
    final typeCounts = state.documentTypeCount;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Document Types',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: typeCounts.entries.map((entry) {
              final type = entry.key;
              final count = entry.value;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: _getDocumentTypeColor(type).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _getDocumentTypeColor(type).withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      type.icon,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      type.displayName,
                      style: TextStyle(
                        color: _getDocumentTypeColor(type),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getDocumentTypeColor(type),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$count',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentDocuments(DocumentVaultState state) {
    final recentDocs = state.recentDocuments.take(5).toList();
    
    if (recentDocs.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.folder_open, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('No documents uploaded yet'),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Recent Documents',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (state.totalDocuments > 5) ...[
              const Spacer(),
              TextButton(
                onPressed: () {
                  _tabController.animateTo(1);
                },
                child: const Text('View All'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        ...recentDocs.map((document) {
          return AnimationConfiguration.staggeredList(
            position: recentDocs.indexOf(document),
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: DocumentCard(document: document),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildExpiringDocuments(DocumentVaultState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                'Expiring Soon (${state.expiringDocuments.length})',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...state.expiringDocuments.take(3).map((document) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    document.type.icon,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      document.fileName,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Expires: ${_formatDate(document.expirationDate!)}',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildExpiredDocuments(DocumentVaultState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                'Expired Documents (${state.expiredDocuments.length})',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...state.expiredDocuments.take(3).map((document) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    document.type.icon,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      document.fileName,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Expired: ${_formatDate(document.expirationDate!)}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDocumentsTab(DocumentVaultState state) {
    return Column(
      children: [
        DocumentFilterChips(
          categories: state.categories,
          tags: state.tags,
          selectedFilter: state.selectedFilter,
          selectedType: state.selectedType,
          selectedCategory: state.selectedCategory,
          selectedTag: state.selectedTag,
          onFilterChanged: (filter, {type, category, tag}) {
            switch (filter) {
              case DocumentFilter.all:
                context.read<DocumentVaultBloc>().add(const LoadDocuments());
                break;
              case DocumentFilter.type:
                if (type != null) {
                  context.read<DocumentVaultBloc>().add(FilterByType(type));
                }
                break;
              case DocumentFilter.category:
                if (category != null) {
                  context.read<DocumentVaultBloc>().add(FilterByCategory(category));
                }
                break;
              case DocumentFilter.tag:
                if (tag != null) {
                  context.read<DocumentVaultBloc>().add(FilterByTag(tag));
                }
                break;
              default:
                break;
            }
          },
        ),
        Expanded(
          child: state.filteredDocuments.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_open, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No documents found'),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.filteredDocuments.length,
                  itemBuilder: (context, index) {
                    final document = state.filteredDocuments[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: DocumentCard(document: document),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSearchTab(DocumentVaultState state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search documents...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _searchController.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
            onSubmitted: (query) {
              if (query.isNotEmpty) {
                context.read<DocumentVaultBloc>().add(SearchDocuments(query));
              }
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: state.selectedFilter == DocumentFilter.search
                ? ListView.builder(
                    itemCount: state.filteredDocuments.length,
                    itemBuilder: (context, index) {
                      final document = state.filteredDocuments[index];
                      return DocumentCard(document: document);
                    },
                  )
                : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('Enter a search query above'),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _showAddMenu() {
    // Modal routes sit above the current route, so the sheet's BuildContext is not a
    // descendant of BlocProvider<DocumentVaultBloc>. Read the bloc from this route's context.
    final bloc = context.read<DocumentVaultBloc>();
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.file_upload),
              title: const Text('Upload File'),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(const UploadFile());
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(UploadImage(ImageSource.camera));
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(UploadImage(ImageSource.gallery));
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getDocumentTypeColor(DocumentType type) {
    switch (type) {
      case DocumentType.receipt:
        return Colors.blue;
      case DocumentType.invoice:
        return Colors.green;
      case DocumentType.contract:
        return Colors.purple;
      case DocumentType.statement:
        return Colors.orange;
      case DocumentType.warranty:
        return Colors.red;
      case DocumentType.manual:
        return Colors.teal;
      case DocumentType.photo:
        return Colors.pink;
      case DocumentType.pdf:
        return Colors.indigo;
      case DocumentType.other:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
