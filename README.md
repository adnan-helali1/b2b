# b2b

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

system design<img width="623" height="531" alt="image" src="https://github.com/user-attachments/assets/6734e160-233c-4409-9fd7-5fa038af7a54" />

# B2B Smart Ordering System - Documentation

## نظرة عامة على النظام
نظام B2B Smart Ordering System هو تطبيق موبايل شامل لإدارة الطلبات بين السوبرماركت والموردين، مع لوحة تحكم للإدارة.

---

## الأدوار الثلاثة (Roles)

### 1️⃣ **Supermarket (السوبرماركت)**
دور السوبرماركت للتسوق وإدارة المخزون والمبيعات.

#### الشاشات:
- **الرئيسية (Home)**: `/`
  - بحث عن المنتجات والموردين
  - إحصائيات سريعة
  - الفئات
  - آخر الطلبات
  - الموردين المميزين

- **الطلبات (Orders)**: `/orders`
  - عرض جميع الطلبات
  - تتبع حالة الطلبات (قيد المعالجة، تم الشحن، تم التسليم)
  - تفاصيل الطلب

- **المخزون (Inventory)**: `/inventory`
  - عرض المنتجات المتوفرة
  - كميات المخزون
  - تنبيهات المخزون المنخفض
  - إعادة الطلب

- **الفواتير (Invoices)**: `/invoices`
  - **فواتير المشتريات**: الشراء من الموردين
  - **فواتير المبيعات**: البيع للعملاء
  - إحصائيات مالية
  - تحميل الفواتير

- **نقطة البيع (POS/Sales)**: `/sales`
  - نظام POS كامل
  - إضافة منتجات من المخزون
  - إدارة السلة
  - الدفع (نقدي/بطاقة)
  - إصدار فواتير مبيعات تلقائياً
  - تخفيض المخزون تلقائياً

- **الإشعارات (Notifications)**: `/notifications`
  - تحديثات الطلبات
  - تنبيهات المخزون المنخفض
  - تأكيدات التسليم
  - إشعارات النظام

- **إنشاء طلب (Create Order)**: `/create-order`
  - اختيار المورد
  - البحث عن المنتجات
  - إضافة للسلة
  - إرسال الطلب

#### منطق الأعمال:
```
شراء منتج → يتم إضافته للمخزون → يتم إنشاء فاتورة شراء
بيع منتج → يتم تخفيض المخزون → يتم إنشاء فاتورة مبيعات
```

---

### 2️⃣ **Supplier (المورد)**
دور المورد لإدارة الطلبات والفواتير والعملاء.

#### الشاشات:
- **المنتجات (Products)**: `/supplier`
  - عرض المنتجات (للمشاهدة فقط، لا يدير المخزون)
  - معلومات المنتجات

- **الطلبات (Orders)**: `/supplier/orders`
  - استلام طلبات من السوبرماركت
  - قبول/رفض الطلبات
  - تغيير حالة الطلب:
    - قيد المعالجة → قيد التجهيز → تم الشحن → تم التسليم

- **الفواتير (Invoices)**: `/supplier/invoices`
  - فواتير لجميع الطلبات المقبولة
  - تتبع المدفوعات (مدفوعة/جزئية/معلقة)
  - المبالغ المحصلة والمعلقة
  - نسبة التحصيل

- **العملاء (Customers)**: `/supplier/customers`
  - قائمة عملاء السوبرماركت
  - الملخص المالي لكل عميل:
    - إجمالي الطلبات
    - المبلغ المدفوع
    - المبلغ المعلق
  - آخر الطلبات
  - معلومات الاتصال

#### منطق الأعمال:
```
استلام طلب → قبول → تجهيز → شحن → تسليم
تلقائياً يتم إنشاء فاتورة → تتبع الدفعات
```

---

### 3️⃣ **Admin (المدير)**
دور المدير للتحكم الكامل في النظام.

#### الشاشات:
- **لوحة التحكم (Dashboard)**: `/admin`
  - إحصائيات شاملة
  - الإيرادات
  - عدد الطلبات
  - المستخدمين النشطين

- **المنتجات (Products)**: `/admin/products`
  - إضافة/تعديل/حذف المنتجات
  - تعيين الموردين للمنتجات
  - إدارة الفئات
  - تحديد الأسعار

- **المستخدمين (Users)**: `/admin/users`
  - إدارة حسابات السوبرماركت
  - إدارة حسابات الموردين
  - الصلاحيات

- **الطلبات (Orders)**: `/admin/orders`
  - عرض جميع الطلبات في النظام
  - مراقبة حالات الطلبات

- **التقارير (Reports)**: `/admin/reports`
  - تقارير المبيعات
  - تقارير المخزون
  - تقارير الموردين

---

## مميزات التصميم

### 🎨 نظام الألوان
```css
Primary: #1E3A8A (أزرق داكن)
Secondary: #3B82F6 (أزرق فاتح)
Background: #F9FAFB (رمادي فاتح جداً)
Success: #10B981 (أخضر)
Destructive: #EF4444 (أحمر)
```

### 🌓 Dark Mode
- دعم كامل للوضع الليلي
- تبديل سلس بين الأوضاع
- ألوان متوافقة مع كلا الوضعين

### 📱 Mobile-First Design
- تصميم متجاوب 100%
- Bottom Navigation لكل دور
- أيقونات واضحة
- تفاعلات سلسة

### 🧩 Component-Based Structure
كل عنصر قابل لإعادة الاستخدام:
- `ProductCard`: بطاقة المنتج
- `OrderCard`: بطاقة الطلب
- `InvoiceCard`: بطاقة الفاتورة
- `StatsCard`: بطاقة الإحصائيات
- `StatusBadge`: شارة الحالة

---

## Navigation Structure

### Supermarket Bottom Navigation:
1. الرئيسية (Home)
2. الطلبات (Orders)
3. المخزون (Inventory)
4. الفواتير (Invoices)
5. نقطة البيع (Sales)

### Supplier Bottom Navigation:
1. المنتجات (Products)
2. الطلبات (Orders)
3. الفواتير (Invoices)
4. العملاء (Customers)

### Admin Bottom Navigation:
1. لوحة التحكم (Dashboard)
2. المنتجات (Products)
3. المستخدمين (Users)
4. الطلبات (Orders)
5. التقارير (Reports)

---

## User Flows

### 🛒 Buy Product Flow (شراء منتج)
```
1. Supermarket يفتح "إنشاء طلب"
2. يختار المورد
3. يبحث عن المنتجات ويضيفها للسلة
4. يراجع الطلب ويرسله
5. Supplier يستلم الطلب ويقبله
6. Supplier يغير الحالة (تجهيز → شحن → تسليم)
7. Supermarket يستلم إشعار بالتسليم
8. المنتجات تُضاف تلقائياً للمخزون
9. تُنشأ فاتورة شراء تلقائياً
```

### 💰 Sell Product Flow (بيع منتج)
```
1. Supermarket يفتح "نقطة البيع"
2. يبحث عن المنتجات من المخزون
3. يضيف المنتجات للسلة
4. يختار طريقة الدفع (نقدي/بطاقة)
5. يُتم عملية البيع
6. المخزون يتم تخفيضه تلقائياً
7. تُنشأ فاتورة مبيعات تلقائياً
```

### 📦 Order Tracking Flow (تتبع الطلب)
```
Pending → Accepted → Preparing → Shipped → Delivered
```

### 📄 Invoice Generation Flow (إنشاء الفاتورة)
```
عند الشراء → فاتورة مشتريات
عند البيع → فاتورة مبيعات
```

---

## الحالات والأيقونات

### حالات الطلبات:
- ⏳ **قيد المعالجة** (Pending) - أزرق
- ✅ **تم القبول** (Accepted) - أخضر فاتح
- 📦 **قيد التجهيز** (Preparing) - برتقالي
- 🚚 **تم الشحن** (Shipped) - بنفسجي
- ✅ **تم التسليم** (Delivered) - أخضر داكن
- ❌ **مرفوض** (Rejected) - أحمر

### حالات الفواتير:
- ✅ **مدفوعة** (Paid) - أخضر
- ⏳ **معلقة** (Pending) - أحمر
- 💰 **جزئية** (Partial) - أصفر

### أولويات الإشعارات:
- 🔴 **عاجل** (High) - أحمر
- 🟡 **متوسط** (Medium) - أصفر
- ⚪ **عادي** (Low) - رمادي

---

## الإشعارات

### أنواع الإشعارات:
1. **إشعارات الطلبات**:
   - تحديث حالة الطلب
   - قبول/رفض الطلب
   - شحن الطلب

2. **إشعارات المخزون**:
   - مخزون منخفض
   - انتهى المخزون
   - إعادة التخزين مطلوبة

3. **إشعارات التسليم**:
   - تم التسليم بنجاح
   - تأخير في التسليم

4. **إشعارات النظام**:
   - تحديثات
   - صيانة
   - ميزات جديدة

---

## Technology Stack

### Frontend:
- ⚛️ **React 18.3.1** (with TypeScript)
- 🎨 **Tailwind CSS v4**
- 🧭 **React Router 7**
- 🎭 **Radix UI** (Component Library)
- 🎉 **Lucide React** (Icons)
- 📊 **Recharts** (Charts)
- 🌙 **next-themes** (Dark Mode)
- 🔔 **Sonner** (Toast Notifications)

### Design System:
- 8pt Grid System
- Consistent spacing
- Typography scale
- Color tokens
- Component-based architecture

---

## Routes Map

### Authentication:
- `/login` - تسجيل الدخول
- `/register` - التسجيل
- `/forgot-password` - نسيت كلمة المرور

### Supermarket:
- `/` - الرئيسية
- `/orders` - الطلبات
- `/inventory` - المخزون
- `/invoices` - الفواتير
- `/sales` - نقطة البيع
- `/notifications` - الإشعارات
- `/profile` - الملف الشخصي
- `/create-order` - إنشاء طلب جديد

### Supplier:
- `/supplier` - المنتجات
- `/supplier/orders` - الطلبات
- `/supplier/invoices` - الفواتير
- `/supplier/customers` - العم��اء
- `/supplier/profile` - الملف الشخصي

### Admin:
- `/admin` - لوحة التحكم
- `/admin/products` - المنتجات
- `/admin/users` - المستخدمين
- `/admin/orders` - الطلبات
- `/admin/reports` - التقارير

---

## Flutter Conversion Notes

### Component Mapping:
```
React Card → Flutter Card
React Button → Flutter ElevatedButton/OutlinedButton
React Input → Flutter TextField
React Badge → Flutter Chip
React Dialog → Flutter showDialog
React Tabs → Flutter TabBar/TabBarView
```

### State Management:
- يمكن استخدام Provider أو Riverpod
- الـ State الحالي في React hooks يمكن تحويله لـ StatefulWidget

### Navigation:
- React Router → Flutter Navigator/GoRouter
- Bottom Navigation → BottomNavigationBar

---

## Business Logic Implementation

### Purchase Flow:
```dart
Future<void> purchaseProduct() async {
  // 1. Create order
  final order = await createOrder(items);
  
  // 2. Send to supplier
  await sendOrderToSupplier(order);
  
  // 3. Wait for delivery
  final delivered = await trackDelivery(order.id);
  
  // 4. Add to inventory
  await addToInventory(order.items);
  
  // 5. Generate purchase invoice
  await generatePurchaseInvoice(order);
  
  // 6. Send notification
  await sendNotification("تم تسليم الطلب");
}
```

### Sales Flow:
```dart
Future<void> sellProduct() async {
  // 1. Select products from inventory
  final cart = await selectFromInventory();
  
  // 2. Process payment
  final payment = await processPayment(cart);
  
  // 3. Reduce inventory
  await reduceInventory(cart.items);
  
  // 4. Generate sales invoice
  await generateSalesInvoice(cart);
}
```

---

## Key Features Summary

✅ **منطق أعمال كامل**: ليس مجرد UI، بل نظام عمل حقيقي
✅ **بنية مكونات**: قابل للتحويل مباشرة إلى Flutter Widgets
✅ **ثلاث تدفقات منفصلة**: Admin, Supplier, Supermarket
✅ **نظام فواتير شامل**: مشتريات + مبيعات
✅ **نظام POS**: بيع مباشر مع تخفيض المخزون
✅ **نظام مالي للموردين**: تتبع الفواتير والأرصدة
✅ **إشعارات تفاعلية**: لجميع التحديثات الهامة
✅ **Dark Mode**: دعم كامل
✅ **صور حقيقية**: من Unsplash
✅ **Mobile-First**: تصميم موبايل أولاً

---

## Production Ready ✨

هذا النظام جاهز للإنتاج ويمكن تحويله مباشرة إلى تطبيق Flutter مع:
- بنية واضحة
- منطق أعمال كامل
- تدفقات مترابطة
- تصميم احترافي
- تجربة مستخدم سلسة

---
