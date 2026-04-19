import 'package:b2b/modules/super/features/store/ui/screens/super_store_screen.dart';

class StoreItem {
  final String imagePath;
  final String name;
  final String category;
  final String unit;
  final int stock;
  final int minStock;
  final int maxStock;
  final StockFilter status;

  const StoreItem({
    required this.imagePath,
    required this.name,
    required this.category,
    required this.unit,
    required this.stock,
    required this.minStock,
    required this.maxStock,
    required this.status,
  });
}

List<StoreItem> items = [
  StoreItem(
    name: 'طماطم طازجة',
    category: 'خضروات - مزارع الخير',
    imagePath: 'assets/images/tomato.jfif',
    unit: 'كجم',
    stock: 35,
    minStock: 50,
    maxStock: 200,
    status: StockFilter.low,
  ),
  StoreItem(
    name: 'زيت زيتون بكر',
    category: 'بقالة - النقاء الممتازة',
    imagePath: 'assets/images/oil.jfif',
    unit: 'لتر',
    stock: 85,
    minStock: 30,
    maxStock: 100,
    status: StockFilter.normal,
  ),
  StoreItem(
    name: 'أرز بسمتي',
    category: 'حبوب - أرض الخير',
    imagePath: 'assets/images/rise.jfif',
    unit: 'كيس',
    stock: 170,
    minStock: 40,
    maxStock: 250,
    status: StockFilter.normal,
  ),
  StoreItem(
    name: 'صدر دجاج',
    category: 'لحوم - مزارع المروج',
    imagePath: 'assets/images/chicken.jfif',
    unit: 'كجم',
    stock: 18,
    minStock: 25,
    maxStock: 120,
    status: StockFilter.low,
  ),
];
