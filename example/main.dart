import 'package:valersi/valersi.dart';

void main() {
  _printConsoleExamples();
}

void _printConsoleExamples() {
  print('╔═══════════════════════════════════════════════╗');
  print('║             Valersi - Examples                ║');
  print('╚═══════════════════════════════════════════════╝\n');

  // Bank Card
  final card = '6037991199500590';
  print('Card Number : $card');
  print('Bank Name : ${Valersi.bankDetect(card)}');
  print('Is Valid? : ${Valersi.bankCardNO(card)}');
  print('Format : ${Valersi.formatCardNo(card)}\n');

  // Sheba - IBAN
  const iban = '180170000000205511280008';
  print('IBAN Number (Sheba) : $iban');
  print('Is Valid? : ${Valersi.iban(iban)}');
  print('Bank Name: ${Valersi.bankDetect(iban)}\n');

  // National ID
  const national = '4607073156';
  print('National ID : $national');
  print('Is Valid? : ${Valersi.nationalCode(national)}\n');

  // Legal ID
  const legal = '14002022404';
  print('Legal National ID : $legal');
  print('Is Valid? : ${Valersi.legalNationID(legal)}\n');

  // Post Code
  const postcode = '1234567890';
  print('Post Code : $postcode');
  print('Is Valid? : ${Valersi.postCode(postcode)}\n');

  // Mobile Number
  const mobile = '09123456789';
  print('Phone Number : $mobile');
  print('Is Valid? : ${Valersi.mobileNO(mobile)}\n');

  // Email
  const email = 'example@gmail.com';
  print('Email : $email');
  print('Is Valid? : ${Valersi.email(email)}\n');

  // UUID
  const uuid = '123e4567-e89b-12d3-a456-426614174000';
  print('UUID : $uuid');
  print('UUID Is Valid? :   ${Valersi.uuid(uuid)}');
  print('UUID v4 Is Valid? : ${Valersi.uuidv4(uuid)}\n');

  // Number Converter
  const text = '۱۲۳۴۵۶۷۸۹۰';
  print('Text : $text');
  print('To English : ${Valersi.toEnglishNumbers(text)}');
  print('To Persian : ${Valersi.toPersianNumbers(text)}\n');

  // Money Formater
  const amount = '160000';
  print('Amount : $amount');
  print('Format : ${Valersi.formatMoney(amount)}\n');

  // Language
  const textt = 'Hello World!';
  print('Text : $textt');
  print('Is Persian : ${Valersi.isPersian(textt)}');
  print('Is English : ${Valersi.isEnglish(textt)}\n');

  // Is Safe
  const unsafe = "hello'); DROP TABLE users; --";
  print('Input: $unsafe');
  print('Is Input Safe? : ${Valersi.isSafe(unsafe)}\n\n');

  //Print Result
  print('╔═══════════════════════════════════════════════╗');
  print('║       All Vlaidators Tested successfuly!      ║');
  print('╚═══════════════════════════════════════════════╝\n');
}
