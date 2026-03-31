import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/receipt_ocr_bloc.dart';

class CaptureOptionsWidget extends StatelessWidget {
  const CaptureOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptOcrBloc, ReceiptOcrState>(
      builder: (context, state) {
        if (state.status == ReceiptOcrStatus.processing) {
          return const ProcessingWidget();
        }

        if (state.status == ReceiptOcrStatus.error) {
          return ErrorWidget(
            errorMessage: state.errorMessage ?? 'An error occurred',
            onRetry: () {
              context.read<ReceiptOcrBloc>().add(const LoadRecentExtractions());
            },
          );
        }

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.receipt_long,
                        size: 120,
                        color: Colors.blue.withValues(alpha: 0.7),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Receipt Scanner',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Capture or select a receipt to automatically extract details',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.withValues(alpha: 0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      _buildCaptureButton(
                        context,
                        icon: Icons.camera_alt,
                        label: 'Take Photo',
                        enabled: state.status != ReceiptOcrStatus.loading,
                        onTap: () {
                          context.read<ReceiptOcrBloc>().add(const CaptureReceipt());
                        },
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 16),
                      _buildCaptureButton(
                        context,
                        icon: Icons.photo_library,
                        label: 'Choose from Gallery',
                        enabled: state.status != ReceiptOcrStatus.loading,
                        onTap: () {
                          context.read<ReceiptOcrBloc>().add(const PickReceiptFromGallery());
                        },
                        color: Colors.green,
                      ),
                      const SizedBox(height: 32),
                      _buildFeatureCard(
                        icon: Icons.auto_awesome,
                        title: 'Smart Extraction',
                        description:
                            'AI-powered OCR extracts merchant, amount, date, and items automatically',
                      ),
                      const SizedBox(height: 16),
                      _buildFeatureCard(
                        icon: Icons.category,
                        title: 'Auto-Categorization',
                        description:
                            'Receipts are automatically categorized based on merchant and items',
                      ),
                      const SizedBox(height: 16),
                      _buildFeatureCard(
                        icon: Icons.cloud_done,
                        title: 'Local Processing',
                        description:
                            'Offline-first processing keeps your receipts stored and analyzed on device',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCaptureButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool enabled,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: enabled ? onTap : null,
        icon: Icon(icon, size: 24),
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProcessingWidget extends StatelessWidget {
  const ProcessingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Processing Receipt...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Our AI is analyzing the receipt to extract details',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _buildProcessingStep(
                    icon: Icons.image_search,
                    title: 'Image Analysis',
                    description: 'Detecting text and receipt structure',
                    isCompleted: true,
                  ),
                  const SizedBox(height: 16),
                  _buildProcessingStep(
                    icon: Icons.text_fields,
                    title: 'Text Extraction',
                    description: 'Extracting text using OCR technology',
                    isCompleted: true,
                  ),
                  const SizedBox(height: 16),
                  _buildProcessingStep(
                    icon: Icons.psychology,
                    title: 'Smart Parsing',
                    description: 'Understanding receipt content and extracting data',
                    isCompleted: false,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProcessingStep({
    required IconData icon,
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isCompleted ? Colors.green : Colors.grey,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isCompleted ? Colors.green : Colors.grey,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
        if (isCompleted)
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 20,
          ),
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red.withValues(alpha: 0.7),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Something went wrong',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    errorMessage,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Try Again'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
