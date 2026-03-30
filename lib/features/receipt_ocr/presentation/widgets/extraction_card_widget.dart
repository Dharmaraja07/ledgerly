import 'package:flutter/material.dart';
import '../../data/models/receipt_extraction_isar.dart';

class ExtractionCard extends StatelessWidget {
  const ExtractionCard({
    super.key,
    required this.extraction,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.onRetry,
  });

  final ReceiptExtractionIsar extraction;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Status icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: extraction.status.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      extraction.status.icon,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  
                  // Main content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          extraction.merchantName ?? 'Unknown Merchant',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(extraction.purchaseDate),
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Amount
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        extraction.totalAmount != null
                            ? '\$${extraction.totalAmount!.toStringAsFixed(2)}'
                            : 'N/A',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: extraction.hasValidAmount ? Colors.green : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: extraction.status.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          extraction.status.displayName,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: extraction.status.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              // Additional details
              if (extraction.hasItems || extraction.category != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (extraction.hasItems) ...[
                      Icon(
                        Icons.receipt_long,
                        size: 16,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${extraction.items.length} items',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                    
                    if (extraction.hasItems && extraction.category != null) ...[
                      const SizedBox(width: 16),
                    ],
                    
                    if (extraction.category != null) ...[
                      Icon(
                        Icons.label,
                        size: 16,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        extraction.category!,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
              
              // Action buttons
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (extraction.hasErrors)
                    TextButton.icon(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh, size: 16),
                      label: const Text('Retry'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.orange,
                      ),
                    ),
                  
                  TextButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text('Edit'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                  ),
                  
                  TextButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, size: 16),
                    label: const Text('Delete'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'No date';
    
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks == 1 ? '' : 's'} ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
