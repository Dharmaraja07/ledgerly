import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/document_isar.dart';
import '../bloc/document_vault_bloc.dart';

class DocumentCard extends StatelessWidget {
  final DocumentIsar document;

  const DocumentCard({
    super.key,
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    final isExpired = document.isExpired;
    final isExpiringSoon = document.expirationDate != null && 
        document.expirationDate!.isBefore(DateTime.now().add(const Duration(days: 30)));

    Color cardColor;
    Color borderColor;
    
    if (isExpired) {
      cardColor = Colors.red.withOpacity(0.1);
      borderColor = Colors.red.withOpacity(0.3);
    } else if (isExpiringSoon) {
      cardColor = Colors.orange.withOpacity(0.1);
      borderColor = Colors.orange.withOpacity(0.3);
    } else {
      cardColor = Colors.white;
      borderColor = Colors.grey.withOpacity(0.3);
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _getDocumentTypeColor(document.type).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      document.type.icon,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document.fileName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (document.description != null)
                          Text(
                            document.description!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (document.isEncrypted)
                        const Icon(Icons.lock, color: Colors.red, size: 20),
                      if (isExpired)
                        const Icon(Icons.error, color: Colors.red, size: 20),
                      if (isExpiringSoon && !isExpired)
                        const Icon(Icons.warning, color: Colors.orange, size: 20),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                        onSelected: (value) {
                          switch (value) {
                            case 'view':
                              _viewDocument(context);
                              break;
                            case 'edit':
                              _editDocument(context);
                              break;
                            case 'encrypt':
                              _encryptDocument(context);
                              break;
                            case 'decrypt':
                              _decryptDocument(context);
                              break;
                            case 'delete':
                              _deleteDocument(context);
                              break;
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'view',
                            child: Row(
                              children: [
                                Icon(Icons.visibility, color: Colors.blue),
                                SizedBox(width: 8),
                                Text('View'),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.green),
                                SizedBox(width: 8),
                                Text('Edit'),
                              ],
                            ),
                          ),
                          if (!document.isEncrypted)
                            const PopupMenuItem(
                              value: 'encrypt',
                              child: Row(
                                children: [
                                  Icon(Icons.lock, color: Colors.orange),
                                  SizedBox(width: 8),
                                  Text('Encrypt'),
                                ],
                              ),
                            ),
                          if (document.isEncrypted)
                            const PopupMenuItem(
                              value: 'decrypt',
                              child: Row(
                                children: [
                                  Icon(Icons.lock_open, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Decrypt'),
                                ],
                              ),
                            ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                SizedBox(width: 8),
                                Text('Delete'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          document.type.displayName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          document.formattedFileSize,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uploaded',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          _formatDate(document.uploadDate),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (document.category != null || document.tagList.isNotEmpty) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (document.category != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.withOpacity(0.3)),
                        ),
                        child: Text(
                          document.category!,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    ...document.tagList.take(3).map((tag) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
              if (document.expirationDate != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isExpired 
                        ? Colors.red.withOpacity(0.1)
                        : isExpiringSoon
                            ? Colors.orange.withOpacity(0.1)
                            : Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isExpired 
                          ? Colors.red.withOpacity(0.3)
                          : isExpiringSoon
                              ? Colors.orange.withOpacity(0.3)
                              : Colors.green.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isExpired ? Icons.error : isExpiringSoon ? Icons.warning : Icons.schedule,
                        size: 16,
                        color: isExpired ? Colors.red : isExpiringSoon ? Colors.orange : Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isExpired 
                            ? 'Expired on ${_formatDate(document.expirationDate!)}'
                            : isExpiringSoon
                                ? 'Expires on ${_formatDate(document.expirationDate!)}'
                                : 'Expires: ${_formatDate(document.expirationDate!)}',
                        style: TextStyle(
                          color: isExpired ? Colors.red : isExpiringSoon ? Colors.orange : Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _viewDocument(BuildContext context) {
    // TODO: Implement document viewing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document viewing not implemented yet')),
    );
  }

  void _editDocument(BuildContext context) {
    // TODO: Implement document editing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document editing not implemented yet')),
    );
  }

  void _encryptDocument(BuildContext context) {
    context.read<DocumentVaultBloc>().add(EncryptDocument(document.documentId));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document encrypted')),
    );
  }

  void _decryptDocument(BuildContext context) {
    context.read<DocumentVaultBloc>().add(DecryptDocument(document.documentId));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document decrypted')),
    );
  }

  void _deleteDocument(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Document'),
        content: Text('Are you sure you want to delete "${document.fileName}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<DocumentVaultBloc>().add(DeleteDocument(document.documentId));
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
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
