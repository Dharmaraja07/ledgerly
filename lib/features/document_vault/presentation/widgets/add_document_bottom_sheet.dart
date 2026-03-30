import 'package:flutter/material.dart';
import '../../data/models/document_isar.dart';
import '../../../../core/theme/app_theme.dart';

class AddDocumentBottomSheet extends StatefulWidget {
  const AddDocumentBottomSheet({super.key});

  @override
  State<AddDocumentBottomSheet> createState() => _AddDocumentBottomSheetState();
}

class _AddDocumentBottomSheetState extends State<AddDocumentBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _fileNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _tagsController = TextEditingController();
  
  DocumentType _type = DocumentType.other;
  DateTime? _expirationDate;
  bool _isEncrypted = false;

  @override
  void dispose() {
    _fileNameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInfoSection(),
                    const SizedBox(height: 20),
                    _buildDocumentDetailsSection(),
                    const SizedBox(height: 20),
                    _buildSecuritySection(),
                    const SizedBox(height: 30),
                    _buildSaveButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white),
          ),
          const Spacer(),
          const Text(
            'Add Document Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildBasicInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _fileNameController,
          decoration: InputDecoration(
            hintText: 'Document name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.description),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter document name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<DocumentType>(
          value: _type,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Text(_type.icon, style: const TextStyle(fontSize: 20)),
          ),
          items: DocumentType.values.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Row(
                children: [
                  Text(type.icon),
                  const SizedBox(width: 8),
                  Text(type.displayName),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _type = value!;
            });
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _descriptionController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add a description...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.note),
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Document Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _categoryController,
          decoration: InputDecoration(
            hintText: 'e.g., Financial, Legal, Personal',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.folder),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _tagsController,
          decoration: InputDecoration(
            hintText: 'e.g., tax,2024,important (comma separated)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.label),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: _selectExpirationDate,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.event),
                const SizedBox(width: 12),
                Text(
                  _expirationDate != null 
                      ? 'Expires: ${_formatDate(_expirationDate!)}'
                      : 'No expiration date',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                if (_expirationDate != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _expirationDate = null;
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecuritySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Security',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Checkbox(
              value: _isEncrypted,
              onChanged: (value) {
                setState(() {
                  _isEncrypted = value!;
                });
              },
            ),
            const Text(
              'Encrypt this document',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (_isEncrypted) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock, color: Colors.orange),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Encrypted documents will require authentication to view',
                    style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _saveDocument,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Save Document',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _selectExpirationDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _expirationDate ?? DateTime.now().add(const Duration(days: 365)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );
    if (date != null) {
      setState(() {
        _expirationDate = date;
      });
    }
  }

  void _saveDocument() {
    if (_formKey.currentState!.validate()) {
      // This would typically be called after file upload
      // For now, we'll just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document details saved')),
      );
      Navigator.pop(context);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
