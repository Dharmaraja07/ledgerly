import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/security/passphrase_encryption.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../expense/domain/repositories/expense_repository.dart';

/// Offline-first collaboration: encrypted handoff of ledger data for advisors or partners.
class CollaborationHubPage extends StatefulWidget {
  const CollaborationHubPage({
    super.key,
    required this.groupId,
    this.workspaceLabel = 'Primary workspace',
  });

  final String groupId;
  final String workspaceLabel;

  @override
  State<CollaborationHubPage> createState() => _CollaborationHubPageState();
}

class _CollaborationHubPageState extends State<CollaborationHubPage> {
  final _passphrase = TextEditingController();
  final _note = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _passphrase.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _exportEncrypted() async {
    final secret = _passphrase.text.trim();
    if (secret.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Use a passphrase of at least 8 characters.')),
      );
      return;
    }
    setState(() => _busy = true);
    try {
      final repo = getIt<ExpenseRepository>();
      final expenses = await repo.getExpenses(widget.groupId);
      final payload = {
        'exportedAt': DateTime.now().toUtc().toIso8601String(),
        'groupId': widget.groupId,
        'workspace': widget.workspaceLabel,
        'note': _note.text.trim(),
        'transactions': expenses
            .where((e) => !e.isDeleted)
            .map(
              (e) => {
                'id': e.id,
                'title': e.title,
                'amount': e.amount,
                'category': e.category,
                'type': e.transactionType.name,
                'updatedAt': e.updatedAt.toUtc().toIso8601String(),
              },
            )
            .toList(),
      };
      final json = const JsonEncoder.withIndent('  ').convert(payload);
      final sealed = PassphraseEncryption.seal(json, secret);

      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/ledgerly_share_${widget.groupId}_${DateTime.now().millisecondsSinceEpoch}.ledgerlyenc',
      );
      await file.writeAsString(sealed);

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text:
              'Encrypted Ledgerly snapshot. Open in Ledgerly with the same passphrase.',
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Collaboration',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Share encrypted snapshots with an accountant or partner. '
            'Nothing is uploaded automatically—you choose how to send the file.',
            style: GoogleFonts.outfit(color: AppColors.textSecondary, height: 1.4),
          ),
          const SizedBox(height: 20),
          Text(
            widget.workspaceLabel,
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _note,
            decoration: const InputDecoration(
              labelText: 'Cover note (optional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passphrase,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Passphrase',
              helperText: 'Share this passphrase separately from the file.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _busy ? null : _exportEncrypted,
            icon: _busy
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.lock_outline),
            label: Text(_busy ? 'Preparing…' : 'Create encrypted share file'),
          ),
        ],
      ),
    );
  }
}
