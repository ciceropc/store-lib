import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:app/theme/app_theme.dart';

class Helpers {
  static final formatCurrency = NumberFormat.simpleCurrency(locale: 'ptBR');

  static String toCurrencyReal(value) {
    return formatCurrency.format(value);
  }

  static String formatddMMyyyy(String value) {
    try {
      final f = new DateFormat('dd/MM/yyy');

      DateTime dateTime = DateTime.parse(value);

      return f.format(dateTime);
    } catch (e) {
      return '';
    }
  }

  static Widget cardIcon(String paymentSystem) {
    switch (paymentSystem) {
      case '1':
        return SvgPicture.asset('assets/icons/amex.svg', height: 18);
        break;
      case '2':
        return SvgPicture.asset('assets/icons/visa.svg', height: 18);
        break;
      case '3':
        return SvgPicture.asset('assets/icons/diners.svg', height: 18);
        break;
      case '4':
        return SvgPicture.asset('assets/icons/mastercard.svg', height: 18);
        break;
      case '9':
        return SvgPicture.asset('assets/icons/elo.svg', height: 18);
        break;
      case '6':
        return SvgPicture.asset('assets/icons/jcb.svg', height: 18);
        break;
      case '8':
        return SvgPicture.asset('assets/icons/hipercard.svg', height: 18);
      case '113':
        return SvgPicture.asset('assets/icons/debit_card.svg', height: 18);
        break;
      default:
        return SvgPicture.asset('assets/icons/credit_card.svg', color: accentColor, height: 18);
        break;
    }
  }

  static String getEstimationString(String shippingEstimate) {
    if (shippingEstimate.contains('bd')) {
      int day = int.parse(shippingEstimate.replaceAll('bd', ''));

      if (day > 1) {
        return 'Em até $day dias úteis';
      } else {
        return 'Em até $day dia útil';
      }
    } else if (shippingEstimate.contains('d')) {
      int day = int.parse(shippingEstimate.replaceAll('d', ''));

      if (day > 1) {
        return 'Em até $day dias';
      } else {
        return 'Em até $day dia';
      }
    } else if (shippingEstimate.contains('h')) {
      int hour = int.parse(shippingEstimate.replaceAll('h', ''));

      if (hour > 1) {
        return 'Em até $hour horas';
      } else {
        return 'Em até $hour hora';
      }
    } else {
      return 'Em até $shippingEstimate';
    }
  }
}
