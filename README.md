# BMI Calculator 📊

**BMI Calculator** เป็นแอปพลิเคชัน Flutter สำหรับคำนวณค่า **ดัชนีมวลกาย (BMI - Body Mass Index)** ซึ่งช่วยให้ผู้ใช้สามารถทราบสถานะน้ำหนักของตนเอง และระดับความเสี่ยงของภาวะน้ำหนักเกินหรืออ้วน  

## 🛠 เทคโนโลยีที่ใช้
- **Flutter** (สำหรับการพัฒนา UI และโลจิกของแอป)
- **Dart** (ภาษาที่ใช้เขียนโค้ด)
- **Material Design** (สำหรับออกแบบ UI ที่สวยงาม)

---

## 📌 คุณสมบัติของแอปพลิเคชัน
✅ ป้อนค่าของน้ำหนัก (kg) และส่วนสูง (m)  
✅ กดปุ่ม **"คำนวณ BMI"** เพื่อคำนวณค่า BMI  
✅ แสดงผลค่า BMI พร้อมหมวดหมู่สุขภาพ เช่น **น้ำหนักปกติ, อ้วน, ผอม**  
✅ แสดง **ตารางอ้างอิง BMI** เพื่อเปรียบเทียบค่าของตนเอง  

---

## 📱 หน้าจอแสดงผล
แอปพลิเคชันมี UI ที่เรียบง่าย ประกอบด้วย:  
- **TextField** สำหรับกรอกน้ำหนักและส่วนสูง  
- **ElevatedButton** สำหรับคำนวณ BMI  
- **Text** สำหรับแสดงผลลัพธ์ BMI และคำอธิบาย  
- **Table** แสดงตารางเกณฑ์ BMI  

---

## 📝 โครงสร้างของโค้ด

### `main.dart`
โค้ดในไฟล์นี้มีโครงสร้างดังนี้:

### 1️⃣ `BMICalculatorApp`
- เป็นคลาสหลักของแอป **(StatelessWidget)**  
- ใช้ **MaterialApp** กำหนดธีมและกำหนดหน้าแรกเป็น `BMICalculatorScreen()`  

### 2️⃣ `BMICalculatorScreen`
- เป็น **StatefulWidget** ซึ่งเป็นหน้าหลักของแอป  
- มี **TextEditingController** สำหรับรับค่าน้ำหนักและส่วนสูงจากผู้ใช้  
- ใช้ฟังก์ชัน `calculateBMI()` เพื่อคำนวณค่า BMI ตามสูตร  
- ใช้ฟังก์ชัน `getBMICategory()` เพื่อแปลงค่า BMI เป็นคำอธิบาย  

### 3️⃣ `BMIReferenceTable`
- ใช้ **Table Widget** เพื่อสร้างตารางแสดงเกณฑ์ค่าของ BMI  

---

## 🏗 วิธีการติดตั้งและรันแอป
### 1. ติดตั้ง Flutter และ Dart  
ตรวจสอบว่าติดตั้ง Flutter และ Dart แล้วโดยรันคำสั่ง:
```sh
flutter --version
