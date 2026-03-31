import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../bill_reminders/data/models/bill_reminder_isar.dart';
import '../../../bill_reminders/data/repositories/bill_reminder_repository.dart';
import '../../../bill_reminders/presentation/bloc/bill_reminder_bloc.dart';
import '../../../bill_reminders/presentation/screens/bill_reminders_screen.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../category/presentation/bloc/category_event.dart';
import '../../../category/presentation/bloc/category_state.dart';
import '../../../debt_planner/data/models/debt_isar.dart';
import '../../../debt_planner/data/repositories/debt_repository.dart';
import '../../../debt_planner/presentation/bloc/debt_planner_bloc.dart';
import '../../../debt_planner/presentation/screens/debt_planner_screen.dart';
import '../../../document_vault/presentation/bloc/document_vault_bloc.dart';
import '../../../document_vault/presentation/screens/document_vault_screen.dart';
import '../../../expense/domain/entitities/Expense.dart';
import '../../../expense/presentation/bloc/expense_bloc.dart';
import '../../../expense/presentation/bloc/expense_event.dart';
import '../../../investment/data/models/investment_isar.dart';
import '../../../investment/data/repositories/investment_repository.dart';
import '../../../investment/presentation/bloc/investment_bloc.dart';
import '../../../investment/presentation/screens/investment_screen.dart';
import '../../../ledger/presentation/pages/ledger_center_page.dart';
import '../../../activity/presentation/pages/activity_center_page.dart';
import '../../../reports/presentation/pages/reports_center_page.dart';
import '../../../receipt_ocr/presentation/pages/receipt_ocr_page.dart';
import '../../../search/presentation/pages/global_search_page.dart';

class PlannerPage extends StatefulWidget {
  final String groupId;

  const PlannerPage({super.key, required this.groupId});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  static const _goalsKey = 'planner_goals_v1';
  static const _recurringKey = 'planner_recurring_v1';
  static const _accountsKey = 'planner_accounts_v1';

  final SharedPreferences _prefs = getIt<SharedPreferences>();

  List<_SavingsGoal> _goals = const [];
  List<_RecurringTemplate> _templates = const [];
  List<_AccountBucket> _accounts = const [];
  bool _loading = true;
  late Future<_PlannerInsights> _insightsFuture;

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(LoadCategories());
    _insightsFuture = _loadPlannerInsights();
    _loadData();
  }

  Future<_PlannerInsights> _loadPlannerInsights() async {
    final billRepository = getIt<BillReminderRepository>();
    final debtRepository = getIt<DebtRepository>();
    final investmentRepository = getIt<InvestmentRepository>();

    final pendingBills = await billRepository.getPendingBills();
    final overdueBills = pendingBills.where((bill) => bill.isOverdue).toList()
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    final upcomingBills = pendingBills.where((bill) => !bill.isOverdue).toList()
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

    final debts = await debtRepository.getAllDebts();
    final investments = await investmentRepository.getAllInvestments();
    final portfolios = await investmentRepository.getAllPortfolios();

    final recommendedDebtPayment = debts.isEmpty
        ? 0.0
        : debts.fold<double>(0.0, (sum, debt) => sum + debt.minimumPayment) * 1.2;

    DebtPayoffPlan? snowballPlan;
    DebtPayoffPlan? avalanchePlan;
    if (recommendedDebtPayment > 0) {
      snowballPlan = await debtRepository.generatePayoffPlan(
        DebtPayoffStrategy.snowball,
        recommendedDebtPayment,
      );
      avalanchePlan = await debtRepository.generatePayoffPlan(
        DebtPayoffStrategy.avalanche,
        recommendedDebtPayment,
      );
    }

    final allocationByType = <InvestmentType, double>{};
    for (final investment in investments) {
      allocationByType.update(
        investment.type,
        (value) => value + investment.currentValue,
        ifAbsent: () => investment.currentValue,
      );
    }

    return _PlannerInsights(
      pendingBills: pendingBills,
      overdueBills: overdueBills,
      upcomingBills: upcomingBills,
      debts: debts,
      investments: investments,
      portfolios: portfolios,
      recommendedDebtPayment: recommendedDebtPayment,
      snowballPlan: snowballPlan,
      avalanchePlan: avalanchePlan,
      allocationByType: allocationByType,
    );
  }

  void _refreshInsights() {
    setState(() {
      _insightsFuture = _loadPlannerInsights();
    });
  }

  Future<void> _loadData() async {
    final rawGoals = _prefs.getString(_goalsKey);
    final rawTemplates = _prefs.getString(_recurringKey);
    final rawAccounts = _prefs.getString(_accountsKey);

    setState(() {
      _goals = rawGoals == null
          ? []
          : (jsonDecode(rawGoals) as List<dynamic>)
              .map((item) => _SavingsGoal.fromJson(item as Map<String, dynamic>))
              .toList();
      _templates = rawTemplates == null
          ? []
          : (jsonDecode(rawTemplates) as List<dynamic>)
              .map(
                (item) => _RecurringTemplate.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList();
      _accounts = rawAccounts == null
          ? []
          : (jsonDecode(rawAccounts) as List<dynamic>)
              .map((item) => _AccountBucket.fromJson(item as Map<String, dynamic>))
              .toList();
      _loading = false;
    });
  }

  Future<void> _persist() async {
    await _prefs.setString(
      _goalsKey,
      jsonEncode(_goals.map((goal) => goal.toJson()).toList()),
    );
    await _prefs.setString(
      _recurringKey,
      jsonEncode(_templates.map((template) => template.toJson()).toList()),
    );
    await _prefs.setString(
      _accountsKey,
      jsonEncode(_accounts.map((account) => account.toJson()).toList()),
    );
  }

  Future<void> _showAccountDialog([_AccountBucket? existing]) async {
    final nameController = TextEditingController(text: existing?.name ?? '');
    final balanceController = TextEditingController(
      text: existing?.balance.toStringAsFixed(0) ?? '',
    );
    const types = ['Cash', 'Bank', 'Card', 'Savings', 'Investment', 'Loan'];
    var selectedType = existing?.type ?? types.first;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setInnerState) {
            return AlertDialog(
              title: Text(
                existing == null ? 'Add Account' : 'Edit Account',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Account Name'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: selectedType,
                    items: types
                        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setInnerState(() {
                          selectedType = value;
                        });
                      }
                    },
                    decoration: const InputDecoration(labelText: 'Account Type'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: balanceController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                    decoration: const InputDecoration(labelText: 'Current Balance'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final balance = double.tryParse(balanceController.text.trim());
                    if (name.isEmpty || balance == null) {
                      return;
                    }
                    final account = _AccountBucket(
                      id: existing?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
                      name: name,
                      type: selectedType,
                      balance: balance,
                    );

                    setState(() {
                      if (existing == null) {
                        _accounts = [..._accounts, account];
                      } else {
                        _accounts = _accounts
                            .map((item) => item.id == account.id ? account : item)
                            .toList();
                      }
                    });
                    await _persist();
                    if (mounted) {
                      Navigator.pop(dialogContext);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showGoalDialog([_SavingsGoal? existing]) async {
    final nameController = TextEditingController(text: existing?.name ?? '');
    final targetController = TextEditingController(
      text: existing?.targetAmount.toStringAsFixed(0) ?? '',
    );
    final currentController = TextEditingController(
      text: existing?.savedAmount.toStringAsFixed(0) ?? '',
    );
    DateTime selectedDate = existing?.targetDate ?? DateTime.now().add(const Duration(days: 180));

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setInnerState) {
            return AlertDialog(
              title: Text(
                existing == null ? 'Add Savings Goal' : 'Edit Savings Goal',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Goal Name'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: targetController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Target Amount'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: currentController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Already Saved'),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Target Date'),
                      subtitle: Text(DateUtils.dateOnly(selectedDate).toIso8601String().split('T').first),
                      trailing: const Icon(Icons.calendar_today_outlined),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now().subtract(const Duration(days: 365)),
                          lastDate: DateTime.now().add(const Duration(days: 3650)),
                          initialDate: selectedDate,
                        );
                        if (picked != null) {
                          setInnerState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final target = double.tryParse(targetController.text.trim());
                    final saved = double.tryParse(currentController.text.trim()) ?? 0;
                    if (name.isEmpty || target == null || target <= 0) {
                      return;
                    }

                    final goal = _SavingsGoal(
                      id: existing?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
                      name: name,
                      targetAmount: target,
                      savedAmount: saved,
                      targetDate: selectedDate,
                    );

                    setState(() {
                      if (existing == null) {
                        _goals = [..._goals, goal];
                      } else {
                        _goals = _goals.map((item) => item.id == goal.id ? goal : item).toList();
                      }
                    });
                    await _persist();
                    if (mounted) {
                      Navigator.pop(dialogContext);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showRecurringDialog(
    CategoryState categoryState, [
    _RecurringTemplate? existing,
  ]) async {
    final titleController = TextEditingController(text: existing?.title ?? '');
    final amountController = TextEditingController(
      text: existing?.amount.toStringAsFixed(0) ?? '',
    );
    final availableCategories = categoryState is CategoryLoaded && categoryState.categories.isNotEmpty
        ? (categoryState.categories
              .map((item) => item.name.trim())
              .where((name) => name.isNotEmpty)
              .toSet()
              .toList()
            ..sort())
        : ['General'];

    if (availableCategories.isEmpty) {
      availableCategories.add('General');
    }

    var selectedCategory = availableCategories.contains(existing?.category)
        ? existing!.category
        : availableCategories.first;
    var selectedType = existing?.transactionType ?? TransactionType.expense;
    var dueDay = existing?.dayOfMonth ?? DateTime.now().day.clamp(1, 28);
    var isEnabled = existing?.isEnabled ?? true;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setInnerState) {
            return AlertDialog(
              title: Text(
                existing == null ? 'Add Recurring Template' : 'Edit Recurring Template',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Amount'),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: selectedCategory,
                      items: availableCategories
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setInnerState(() {
                            selectedCategory = value;
                          });
                        }
                      },
                      decoration: const InputDecoration(labelText: 'Category'),
                    ),
                    const SizedBox(height: 12),
                    SegmentedButton<TransactionType>(
                      segments: const [
                        ButtonSegment(
                          value: TransactionType.expense,
                          label: Text('Expense'),
                          icon: Icon(Icons.arrow_upward),
                        ),
                        ButtonSegment(
                          value: TransactionType.income,
                          label: Text('Income'),
                          icon: Icon(Icons.arrow_downward),
                        ),
                      ],
                      selected: {selectedType},
                      onSelectionChanged: (selection) {
                        setInnerState(() {
                          selectedType = selection.first;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    Slider(
                      value: dueDay.toDouble(),
                      min: 1,
                      max: 28,
                      divisions: 27,
                      label: 'Day $dueDay',
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setInnerState(() {
                          dueDay = value.round();
                        });
                      },
                    ),
                    Text('Runs on day $dueDay of each month'),
                    SwitchListTile.adaptive(
                      value: isEnabled,
                      onChanged: (value) {
                        setInnerState(() {
                          isEnabled = value;
                        });
                      },
                      activeTrackColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Template Enabled'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () async {
                    final title = titleController.text.trim();
                    final amount = double.tryParse(amountController.text.trim());
                    if (title.isEmpty || amount == null || amount <= 0) {
                      return;
                    }

                    final template = _RecurringTemplate(
                      id: existing?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
                      title: title,
                      amount: amount,
                      category: selectedCategory,
                      transactionType: selectedType,
                      dayOfMonth: dueDay,
                      isEnabled: isEnabled,
                      lastAppliedPeriod: existing?.lastAppliedPeriod,
                    );

                    setState(() {
                      if (existing == null) {
                        _templates = [..._templates, template];
                      } else {
                        _templates = _templates
                            .map((item) => item.id == template.id ? template : item)
                            .toList();
                      }
                    });
                    await _persist();
                    if (mounted) {
                      Navigator.pop(dialogContext);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _runDueTemplates() async {
    final now = DateTime.now();
    final period = '${now.year}-${now.month.toString().padLeft(2, '0')}';
    var created = 0;

    for (final template in _templates) {
      final due = template.isEnabled &&
          template.dayOfMonth <= now.day &&
          template.lastAppliedPeriod != period;

      if (!due) {
        continue;
      }

      context.read<ExpenseBloc>().add(
            AddExpense(
              groupId: widget.groupId,
              title: template.title,
              amount: template.amount,
              paidBy: 'local-user',
              category: template.category,
              splits: {'local-user': template.amount},
              transactionType: template.transactionType,
            ),
          );
      created++;
    }

    if (created > 0) {
      setState(() {
        _templates = _templates
            .map(
              (template) => template.isEnabled &&
                      template.dayOfMonth <= now.day &&
                      template.lastAppliedPeriod != period
                  ? template.copyWith(lastAppliedPeriod: period)
                  : template,
            )
            .toList();
      });
      await _persist();
      _refreshInsights();
    }

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          created == 0
              ? 'No recurring entries are due right now.'
              : 'Applied $created recurring template${created == 1 ? '' : 's'}.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, categoryState) {
        if (_loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        final totalTarget = _goals.fold<double>(0, (sum, goal) => sum + goal.targetAmount);
        final totalSaved = _goals.fold<double>(0, (sum, goal) => sum + goal.savedAmount);
        final overallProgress = totalTarget == 0 ? 0.0 : (totalSaved / totalTarget).clamp(0.0, 1.0);
        final netWorth = _accounts.fold<double>(0, (sum, account) => sum + account.balance);
        final dueTemplates = _templates.where((template) {
          final now = DateTime.now();
          final period = '${now.year}-${now.month.toString().padLeft(2, '0')}';
          return template.isEnabled &&
              template.dayOfMonth <= now.day &&
              template.lastAppliedPeriod != period;
        }).length;
        final upcomingTemplates = _templates
            .where((template) => template.isEnabled)
            .toList()
          ..sort((a, b) => a.dayOfMonth.compareTo(b.dayOfMonth));

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            title: Text(
              'Planner',
              style: GoogleFonts.outfit(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: _runDueTemplates,
                icon: const Icon(Icons.playlist_add_check_rounded, color: AppColors.primary),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF81C784), Color(0xFFFFD54F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Advanced Planning',
                      style: GoogleFonts.outfit(
                        color: Colors.black.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${(overallProgress * 100).toStringAsFixed(0)}% funded across goals',
                      style: GoogleFonts.outfit(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: overallProgress,
                        minHeight: 10,
                        backgroundColor: Colors.black.withValues(alpha: 0.1),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _PlannerMetric(
                            label: 'Saved',
                            value: '₹${totalSaved.toStringAsFixed(0)}',
                          ),
                        ),
                        Expanded(
                          child: _PlannerMetric(
                            label: 'Target',
                            value: '₹${totalTarget.toStringAsFixed(0)}',
                          ),
                        ),
                        Expanded(
                          child: _PlannerMetric(
                            label: 'Due now',
                            value: '$dueTemplates',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Net worth tracker: ₹${netWorth.toStringAsFixed(0)}',
                      style: GoogleFonts.outfit(
                        color: Colors.black.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildCommandCenter(localAccountNetWorth: netWorth),
              const SizedBox(height: 24),
              _PlannerSectionHeader(
                title: 'Savings Goals',
                actionLabel: 'Add Goal',
                onPressed: _showGoalDialog,
              ),
              const SizedBox(height: 12),
              if (_goals.isEmpty)
                const _PlannerEmptyCard(
                  title: 'No savings goals yet',
                  description: 'Create targets for emergency funds, gadgets, vacations, or debt paydown milestones.',
                )
              else
                ..._goals.map(
                  (goal) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _GoalCard(
                      goal: goal,
                      onEdit: () => _showGoalDialog(goal),
                      onDelete: () async {
                        setState(() {
                          _goals = _goals.where((item) => item.id != goal.id).toList();
                        });
                        await _persist();
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              _PlannerSectionHeader(
                title: 'Recurring Templates',
                actionLabel: 'Add Template',
                onPressed: () => _showRecurringDialog(categoryState),
              ),
              const SizedBox(height: 12),
              if (_templates.isEmpty)
                const _PlannerEmptyCard(
                  title: 'No recurring templates yet',
                  description: 'Track salaries, rent, subscriptions, SIPs, or loan repayments with one-tap monthly application.',
                )
              else
                ..._templates.map(
                  (template) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _RecurringCard(
                      template: template,
                      onToggle: (value) async {
                        setState(() {
                          _templates = _templates
                              .map(
                                (item) => item.id == template.id
                                    ? item.copyWith(isEnabled: value)
                                    : item,
                              )
                              .toList();
                        });
                        await _persist();
                      },
                      onEdit: () => _showRecurringDialog(categoryState, template),
                      onDelete: () async {
                        setState(() {
                          _templates = _templates.where((item) => item.id != template.id).toList();
                        });
                        await _persist();
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              const _PlannerSectionHeaderStatic(title: 'Advanced Modules'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Bills',
                      icon: Icons.receipt_long_outlined,
                      color: AppColors.error,
                      onTap: _openBills,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Debt',
                      icon: Icons.account_balance_outlined,
                      color: AppColors.accent,
                      onTap: _openDebtPlanner,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Investments',
                      icon: Icons.trending_up_outlined,
                      color: AppColors.success,
                      onTap: _openInvestments,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Vault',
                      icon: Icons.folder_open_outlined,
                      color: AppColors.primary,
                      onTap: _openVault,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Ledger',
                      icon: Icons.account_balance_wallet_outlined,
                      color: AppColors.textPrimary,
                      onTap: _openLedgerCenter,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Receipt OCR',
                      icon: Icons.document_scanner_outlined,
                      color: AppColors.secondary,
                      onTap: _openReceiptOcr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Search',
                      icon: Icons.manage_search_rounded,
                      color: AppColors.primary,
                      onTap: _openGlobalSearch,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Activity',
                      icon: Icons.history_rounded,
                      color: AppColors.accent,
                      onTap: _openActivityCenter,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _PlannerNavCard(
                      title: 'Reports',
                      icon: Icons.assessment_outlined,
                      color: AppColors.success,
                      onTap: _openReportsCenter,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: SizedBox.shrink()),
                ],
              ),
              const SizedBox(height: 24),
              const _PlannerSectionHeaderStatic(title: 'Upcoming Due Calendar'),
              const SizedBox(height: 12),
              if (upcomingTemplates.isEmpty)
                const _PlannerEmptyCard(
                  title: 'No upcoming due items',
                  description: 'Enabled recurring templates will appear here as your local bill calendar.',
                )
              else
                ...upcomingTemplates.take(5).map(
                  (template) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _UpcomingDueCard(template: template),
                  ),
                ),
              const SizedBox(height: 24),
              _PlannerSectionHeader(
                title: 'Accounts & Liabilities',
                actionLabel: 'Add Account',
                onPressed: _showAccountDialog,
              ),
              const SizedBox(height: 12),
              if (_accounts.isEmpty)
                const _PlannerEmptyCard(
                  title: 'No accounts yet',
                  description: 'Track cash, bank, card, savings, investments, and loans in one local net-worth view.',
                )
              else
                ..._accounts.map(
                  (account) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _AccountCard(
                      account: account,
                      onEdit: () => _showAccountDialog(account),
                      onDelete: () async {
                        setState(() {
                          _accounts = _accounts.where((item) => item.id != account.id).toList();
                        });
                        await _persist();
                      },
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommandCenter({required double localAccountNetWorth}) {
    final recurringIncome = _templates
        .where((template) => template.isEnabled && template.transactionType == TransactionType.income)
        .fold<double>(0.0, (sum, template) => sum + template.amount);
    final recurringExpense = _templates
        .where((template) => template.isEnabled && template.transactionType == TransactionType.expense)
        .fold<double>(0.0, (sum, template) => sum + template.amount);
    final liquidReserve = _accounts
        .where((account) => account.balance > 0 && account.type != 'Loan')
        .fold<double>(0.0, (sum, account) => sum + account.balance);

    return FutureBuilder<_PlannerInsights>(
      future: _insightsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        final insights = snapshot.data;
        if (insights == null) {
          return const _PlannerEmptyCard(
            title: 'Command center unavailable',
            description: 'Add bills, debts, and investments to unlock cross-account strategy insights.',
          );
        }

        final totalNetWorth =
            localAccountNetWorth + insights.totalInvestmentValue - insights.totalDebt;
        final monthlyCommitments =
            recurringExpense + insights.pendingBillsThirtyDaysAmount;
        final monthlyRunway = monthlyCommitments <= 0
            ? null
            : liquidReserve / monthlyCommitments;
        final projectedMonthlyPosition =
            recurringIncome - recurringExpense - insights.pendingBillsThirtyDaysAmount;
        final rebalanceSuggestion = insights.rebalanceSuggestion;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PlannerSectionHeaderStatic(title: 'Financial Command Center'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unified net worth',
                    style: GoogleFonts.outfit(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '₹${totalNetWorth.toStringAsFixed(0)}',
                    style: GoogleFonts.outfit(
                      color: AppColors.textPrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _PlannerMetric(
                          label: 'Invested',
                          value: '₹${insights.totalInvestmentValue.toStringAsFixed(0)}',
                        ),
                      ),
                      Expanded(
                        child: _PlannerMetric(
                          label: 'Debt',
                          value: '₹${insights.totalDebt.toStringAsFixed(0)}',
                        ),
                      ),
                      Expanded(
                        child: _PlannerMetric(
                          label: 'Bills 30d',
                          value: '₹${insights.pendingBillsThirtyDaysAmount.toStringAsFixed(0)}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _InsightCard(
                    title: 'Cash Flow Radar',
                    accent: projectedMonthlyPosition >= 0
                        ? AppColors.success
                        : AppColors.error,
                    icon: projectedMonthlyPosition >= 0
                        ? Icons.trending_up_rounded
                        : Icons.trending_down_rounded,
                    headline:
                        '${projectedMonthlyPosition >= 0 ? '+' : '-'}₹${projectedMonthlyPosition.abs().toStringAsFixed(0)} / month',
                    body:
                        'Recurring income ₹${recurringIncome.toStringAsFixed(0)} vs commitments ₹${monthlyCommitments.toStringAsFixed(0)}.',
                    footer: monthlyRunway == null
                        ? 'Runway opens once monthly commitments are set.'
                        : 'Liquid reserve covers about ${monthlyRunway.toStringAsFixed(1)} months.',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _InsightCard(
                    title: 'Bills Stress Test',
                    accent: insights.overdueBills.isNotEmpty
                        ? AppColors.error
                        : AppColors.primary,
                    icon: insights.overdueBills.isNotEmpty
                        ? Icons.notification_important_outlined
                        : Icons.event_available_outlined,
                    headline:
                        '${insights.overdueBills.length} overdue, ${insights.upcomingBills.take(30).length} upcoming',
                    body:
                        'Pending obligations total ₹${insights.pendingBillsAmount.toStringAsFixed(0)} across your local bill center.',
                    footer: insights.nextDueLabel,
                  ),
                ),
              ],
            ),
            if (insights.debts.isNotEmpty) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _InsightCard(
                      title: 'Debt Strategy Lab',
                      accent: AppColors.accent,
                      icon: Icons.compare_arrows_rounded,
                      headline:
                          'Snowball ${insights.snowballPlan?.totalMonths ?? 0} mo vs Avalanche ${insights.avalanchePlan?.totalMonths ?? 0} mo',
                      body:
                          'Recommended payment: ₹${insights.recommendedDebtPayment.toStringAsFixed(0)} monthly for faster payoff.',
                      footer: insights.strategySummary,
                    ),
                  ),
                ],
              ),
            ],
            if (insights.investments.isNotEmpty) ...[
              const SizedBox(height: 12),
              _InsightCard(
                title: 'Portfolio Rebalance',
                accent: AppColors.success,
                icon: Icons.pie_chart_outline_rounded,
                headline:
                    '${insights.portfolios.length} portfolio${insights.portfolios.length == 1 ? '' : 's'} • ${insights.investments.length} holdings',
                body:
                    'Largest allocation: ${insights.topAllocationLabel}. Total gain/loss ₹${insights.totalGainLoss.toStringAsFixed(0)}.',
                footer: rebalanceSuggestion,
              ),
            ],
          ],
        );
      },
    );
  }

  Future<void> _openBills() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<BillReminderBloc>(),
          child: const BillRemindersScreen(),
        ),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openDebtPlanner() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<DebtPlannerBloc>(),
          child: const DebtPlannerScreen(),
        ),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openInvestments() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<InvestmentBloc>(),
          child: const InvestmentScreen(),
        ),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openVault() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<DocumentVaultBloc>(),
          child: const DocumentVaultScreen(),
        ),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openLedgerCenter() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LedgerCenterPage(groupId: widget.groupId),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openReceiptOcr() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ReceiptOcrPage(),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openGlobalSearch() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GlobalSearchPage(groupId: widget.groupId),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openActivityCenter() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ActivityCenterPage(groupId: widget.groupId),
      ),
    );
    _refreshInsights();
  }

  Future<void> _openReportsCenter() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ReportsCenterPage(groupId: widget.groupId),
      ),
    );
    _refreshInsights();
  }
}

class _PlannerMetric extends StatelessWidget {
  final String label;
  final String value;

  const _PlannerMetric({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            color: Colors.black.withValues(alpha: 0.65),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _PlannerSectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback onPressed;

  const _PlannerSectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.add, color: AppColors.primary, size: 18),
          label: Text(
            actionLabel,
            style: GoogleFonts.outfit(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _PlannerSectionHeaderStatic extends StatelessWidget {
  final String title;

  const _PlannerSectionHeaderStatic({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class _PlannerNavCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _PlannerNavCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.outfit(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlannerEmptyCard extends StatelessWidget {
  final String title;
  final String description;

  const _PlannerEmptyCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final String title;
  final String headline;
  final String body;
  final String footer;
  final IconData icon;
  final Color accent;

  const _InsightCard({
    required this.title,
    required this.headline,
    required this.body,
    required this.footer,
    required this.icon,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 190),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withValues(alpha: 0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accent),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            headline,
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            footer,
            style: GoogleFonts.outfit(
              color: accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  final _SavingsGoal goal;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _GoalCard({
    required this.goal,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (goal.savedAmount / goal.targetAmount).clamp(0.0, 1.0);
    final remaining = (goal.targetAmount - goal.savedAmount).clamp(0.0, double.infinity);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  goal.name,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined, color: AppColors.primary),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: AppColors.error),
              ),
            ],
          ),
          Text(
            'Target date: ${goal.targetDate.toIso8601String().split('T').first}',
            style: GoogleFonts.outfit(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: AppColors.surfaceHighlight,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Saved ₹${goal.savedAmount.toStringAsFixed(0)}',
                  style: GoogleFonts.outfit(
                    color: AppColors.success,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Left ₹${remaining.toStringAsFixed(0)}',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecurringCard extends StatelessWidget {
  final _RecurringTemplate template;
  final ValueChanged<bool> onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _RecurringCard({
    required this.template,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final typeColor = template.transactionType == TransactionType.expense
        ? AppColors.error
        : AppColors.success;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.title,
                      style: GoogleFonts.outfit(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${template.category} • Day ${template.dayOfMonth}',
                      style: GoogleFonts.outfit(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: template.isEnabled,
                onChanged: onToggle,
                activeTrackColor: AppColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${template.transactionType.name.toUpperCase()} • ₹${template.amount.toStringAsFixed(0)}',
                  style: GoogleFonts.outfit(
                    color: typeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined, color: AppColors.primary),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: AppColors.error),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UpcomingDueCard extends StatelessWidget {
  final _RecurringTemplate template;

  const _UpcomingDueCard({required this.template});

  @override
  Widget build(BuildContext context) {
    final color = template.transactionType == TransactionType.expense
        ? AppColors.error
        : AppColors.success;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.calendar_month_outlined, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.title,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${template.category} • Day ${template.dayOfMonth}',
                  style: GoogleFonts.outfit(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Text(
            '₹${template.amount.toStringAsFixed(0)}',
            style: GoogleFonts.outfit(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final _AccountBucket account;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AccountCard({
    required this.account,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isNegative = account.balance < 0;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: (isNegative ? AppColors.error : AppColors.primary).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              isNegative ? Icons.account_balance_wallet_outlined : Icons.savings_outlined,
              color: isNegative ? AppColors.error : AppColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.name,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  account.type,
                  style: GoogleFonts.outfit(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹${account.balance.toStringAsFixed(0)}',
                style: GoogleFonts.outfit(
                  color: isNegative ? AppColors.error : AppColors.success,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined, color: AppColors.primary),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline, color: AppColors.error),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlannerInsights {
  final List<BillReminderIsar> pendingBills;
  final List<BillReminderIsar> overdueBills;
  final List<BillReminderIsar> upcomingBills;
  final List<DebtIsar> debts;
  final List<InvestmentIsar> investments;
  final List<InvestmentPortfolioIsar> portfolios;
  final double recommendedDebtPayment;
  final DebtPayoffPlan? snowballPlan;
  final DebtPayoffPlan? avalanchePlan;
  final Map<InvestmentType, double> allocationByType;

  const _PlannerInsights({
    required this.pendingBills,
    required this.overdueBills,
    required this.upcomingBills,
    required this.debts,
    required this.investments,
    required this.portfolios,
    required this.recommendedDebtPayment,
    required this.snowballPlan,
    required this.avalanchePlan,
    required this.allocationByType,
  });

  double get pendingBillsAmount =>
      pendingBills.fold<double>(0.0, (sum, bill) => sum + bill.amount);

  double get pendingBillsThirtyDaysAmount {
    final threshold = DateTime.now().add(const Duration(days: 30));
    return pendingBills
        .where((bill) => !bill.dueDate.isAfter(threshold))
        .fold<double>(0.0, (sum, bill) => sum + bill.amount);
  }

  double get totalDebt =>
      debts.fold<double>(0.0, (sum, debt) => sum + debt.currentBalance);

  double get totalInvestmentValue =>
      investments.fold<double>(0.0, (sum, investment) => sum + investment.currentValue);

  double get totalGainLoss =>
      investments.fold<double>(0.0, (sum, investment) => sum + investment.unrealizedGainLoss);

  String get nextDueLabel {
    if (pendingBills.isEmpty) {
      return 'No active bills are scheduled right now.';
    }
    final nextBill = pendingBills..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    final due = nextBill.first;
    return 'Next due: ${due.title} on ${due.dueDate.toIso8601String().split('T').first}.';
  }

  String get strategySummary {
    if (snowballPlan == null || avalanchePlan == null) {
      return 'Add debt accounts to compare payoff methods.';
    }

    final fasterStrategy = snowballPlan!.totalMonths <= avalanchePlan!.totalMonths
        ? 'Snowball'
        : 'Avalanche';
    final lowerInterestStrategy =
        snowballPlan!.totalInterestPaid <= avalanchePlan!.totalInterestPaid
            ? 'Snowball'
            : 'Avalanche';
    return '$fasterStrategy wins for speed, $lowerInterestStrategy wins for interest efficiency.';
  }

  String get topAllocationLabel {
    if (allocationByType.isEmpty || totalInvestmentValue <= 0) {
      return 'No allocation data';
    }
    final topEntry = allocationByType.entries.reduce(
      (current, next) => current.value >= next.value ? current : next,
    );
    final share = (topEntry.value / totalInvestmentValue) * 100;
    return '${topEntry.key.displayName} ${share.toStringAsFixed(0)}%';
  }

  String get rebalanceSuggestion {
    if (allocationByType.isEmpty || totalInvestmentValue <= 0) {
      return 'Add holdings to receive local allocation guidance.';
    }

    const targetWeights = <InvestmentType, double>{
      InvestmentType.stock: 50,
      InvestmentType.etf: 20,
      InvestmentType.bond: 15,
      InvestmentType.reit: 5,
      InvestmentType.crypto: 5,
      InvestmentType.commodity: 5,
    };

    InvestmentType? mostOverweight;
    double highestGap = 0.0;

    allocationByType.forEach((type, value) {
      final actualWeight = (value / totalInvestmentValue) * 100;
      final targetWeight = targetWeights[type] ?? 5;
      final gap = actualWeight - targetWeight;
      if (gap > highestGap) {
        highestGap = gap;
        mostOverweight = type;
      }
    });

    if (mostOverweight == null || highestGap < 5) {
      return 'Allocation looks balanced for a broad diversified offline target mix.';
    }

    return 'Consider trimming ${mostOverweight!.displayName} by about ${highestGap.toStringAsFixed(0)}% of portfolio weight.';
  }
}

class _SavingsGoal {
  final String id;
  final String name;
  final double targetAmount;
  final double savedAmount;
  final DateTime targetDate;

  const _SavingsGoal({
    required this.id,
    required this.name,
    required this.targetAmount,
    required this.savedAmount,
    required this.targetDate,
  });

  factory _SavingsGoal.fromJson(Map<String, dynamic> json) {
    return _SavingsGoal(
      id: json['id'] as String,
      name: json['name'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      savedAmount: (json['savedAmount'] as num).toDouble(),
      targetDate: DateTime.parse(json['targetDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'targetAmount': targetAmount,
      'savedAmount': savedAmount,
      'targetDate': targetDate.toIso8601String(),
    };
  }
}

class _RecurringTemplate {
  final String id;
  final String title;
  final double amount;
  final String category;
  final TransactionType transactionType;
  final int dayOfMonth;
  final bool isEnabled;
  final String? lastAppliedPeriod;

  const _RecurringTemplate({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.transactionType,
    required this.dayOfMonth,
    required this.isEnabled,
    this.lastAppliedPeriod,
  });

  factory _RecurringTemplate.fromJson(Map<String, dynamic> json) {
    return _RecurringTemplate(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String,
      transactionType: TransactionType.values.byName(json['transactionType'] as String),
      dayOfMonth: json['dayOfMonth'] as int,
      isEnabled: json['isEnabled'] as bool,
      lastAppliedPeriod: json['lastAppliedPeriod'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'transactionType': transactionType.name,
      'dayOfMonth': dayOfMonth,
      'isEnabled': isEnabled,
      'lastAppliedPeriod': lastAppliedPeriod,
    };
  }

  _RecurringTemplate copyWith({
    bool? isEnabled,
    String? lastAppliedPeriod,
  }) {
    return _RecurringTemplate(
      id: id,
      title: title,
      amount: amount,
      category: category,
      transactionType: transactionType,
      dayOfMonth: dayOfMonth,
      isEnabled: isEnabled ?? this.isEnabled,
      lastAppliedPeriod: lastAppliedPeriod ?? this.lastAppliedPeriod,
    );
  }
}

class _AccountBucket {
  final String id;
  final String name;
  final String type;
  final double balance;

  const _AccountBucket({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
  });

  factory _AccountBucket.fromJson(Map<String, dynamic> json) {
    return _AccountBucket(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      balance: (json['balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'balance': balance,
    };
  }
}
