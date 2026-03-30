import 'package:flutter/material.dart';
import '../../data/models/document_isar.dart';
import '../bloc/document_vault_bloc.dart';

class DocumentFilterChips extends StatelessWidget {
  final List<String> categories;
  final List<String> tags;
  final DocumentFilter selectedFilter;
  final DocumentType? selectedType;
  final String? selectedCategory;
  final String? selectedTag;
  final Function(DocumentFilter, {DocumentType? type, String? category, String? tag}) onFilterChanged;

  const DocumentFilterChips({
    super.key,
    required this.categories,
    required this.tags,
    required this.selectedFilter,
    this.selectedType,
    this.selectedCategory,
    this.selectedTag,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter by',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFilterRow('Type', DocumentType.values.map((type) {
                    return FilterChip(
                      label: Text(type.displayName),
                      selected: selectedFilter == DocumentFilter.type && selectedType == type,
                      onSelected: (selected) {
                        if (selected) {
                          onFilterChanged(DocumentFilter.type, type: type);
                        } else {
                          onFilterChanged(DocumentFilter.all);
                        }
                      },
                      backgroundColor: Colors.grey[200],
                      selectedColor: _getDocumentTypeColor(type).withOpacity(0.2),
                      checkmarkColor: _getDocumentTypeColor(type),
                    );
                  }).toList()),
                  if (categories.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildFilterRow('Category', categories.map((category) {
                      return FilterChip(
                        label: Text(category),
                        selected: selectedFilter == DocumentFilter.category && selectedCategory == category,
                        onSelected: (selected) {
                          if (selected) {
                            onFilterChanged(DocumentFilter.category, category: category);
                          } else {
                            onFilterChanged(DocumentFilter.all);
                          }
                        },
                        backgroundColor: Colors.grey[200],
                        selectedColor: Colors.blue.withOpacity(0.2),
                        checkmarkColor: Colors.blue,
                      );
                    }).toList()),
                  ],
                  if (tags.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildFilterRow('Tags', tags.take(5).map((tag) {
                      return FilterChip(
                        label: Text(tag),
                        selected: selectedFilter == DocumentFilter.tag && selectedTag == tag,
                        onSelected: (selected) {
                          if (selected) {
                            onFilterChanged(DocumentFilter.tag, tag: tag);
                          } else {
                            onFilterChanged(DocumentFilter.all);
                          }
                        },
                        backgroundColor: Colors.grey[200],
                        selectedColor: Colors.green.withOpacity(0.2),
                        checkmarkColor: Colors.green,
                      );
                    }).toList()),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow(String title, List<Widget> chips) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: chips,
        ),
      ],
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
}
