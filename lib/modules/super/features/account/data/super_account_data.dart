class SuperAccountStat {
  final String title;
  final String value;
  final String subtitle;
  final String iconLabel;

  const SuperAccountStat({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconLabel,
  });
}

class SuperAccountInfoRow {
  final String label;
  final String value;

  const SuperAccountInfoRow({required this.label, required this.value});
}

const superAccountStats = [
  SuperAccountStat(
    title: 'إجمالي الطلبات',
    value: '145',
    subtitle: 'خلال الشهر',
    iconLabel: 'طلبات',
  ),
  SuperAccountStat(
    title: 'هذا الشهر',
    value: '23',
    subtitle: 'نشاط جديد',
    iconLabel: 'نمو',
  ),
  SuperAccountStat(
    title: 'الموردين',
    value: '12',
    subtitle: 'حسابات فعالة',
    iconLabel: 'متجر',
  ),
];

const superAccountBusinessInfo = [
  SuperAccountInfoRow(label: 'نوع النشاط', value: 'سوبر ماركت'),
  SuperAccountInfoRow(label: 'رقم السجل التجاري', value: '2345678901'),
  SuperAccountInfoRow(label: 'الرقم الضريبي', value: '310123456700003'),
  SuperAccountInfoRow(label: 'ساعات العمل', value: 'ص 8:00 - م 12:00'),
];
