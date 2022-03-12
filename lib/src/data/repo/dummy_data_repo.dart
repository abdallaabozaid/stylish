import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stylish/config/enums.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';

class DummyDataRepo {
  static final Map<SectionName, List<ProductModel>> allProducts = {
    SectionName.newArrivals: newArrivals,
    SectionName.topTrending: topTrending,
    SectionName.featured: featuredProducts,
  };
  static final List<CategoryModel> categoties = [
    CategoryModel(
      categoryName: 'Shirt',
      category: CategoryName.shirt,
      categoryImageAsset: 'assets/images/categories/shirt.png',
    ),
    CategoryModel(
      categoryName: 'T-Shirt',
      category: CategoryName.tshirt,
      categoryImageAsset: 'assets/images/categories/tshirt.png',
    ),
    CategoryModel(
      categoryName: 'Dress',
      category: CategoryName.dress,
      categoryImageAsset: 'assets/images/categories/dress.png',
    ),
    CategoryModel(
      categoryName: 'Pants',
      category: CategoryName.pants,
      categoryImageAsset: 'assets/images/categories/pants.png',
    ),
  ];

  static final List<ProductModel> newArrivals = [
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '988',
      price: 300,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt1_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt1_red.png',
        const Color(0xffA4A4A4): 'assets/images/clothes/shirts/shirt1_grey.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt1_black.png',
        const Color.fromARGB(255, 243, 137, 187):
            'assets/images/clothes/shirts/shirt1_pink.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '1',
      price: 119,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: const Color.fromARGB(255, 189, 138, 0),
      selectedImage: 'assets/images/clothes/tshirts/tshirt4_orange.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 189, 138, 0):
            'assets/images/clothes/tshirts/tshirt4_orange.png',
        const Color.fromARGB(255, 255, 255, 255):
            'assets/images/clothes/tshirts/tshirt4_white.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '1',
      price: 119,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: const Color.fromARGB(255, 3, 0, 167),
      selectedImage: 'assets/images/clothes/shirts/shirt4_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 3, 0, 167):
            'assets/images/clothes/shirts/shirt4_blue.png',
        const Color.fromARGB(255, 62, 192, 11):
            'assets/images/clothes/shirts/shirt4_green.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '1',
      price: 119,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: const Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt1_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt1_red.png',
        const Color(0xffA4A4A4): 'assets/images/clothes/shirts/shirt1_grey.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt1_black.png',
        const Color.fromARGB(255, 243, 137, 187):
            'assets/images/clothes/shirts/shirt1_pink.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '2',
      price: 120,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: const Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt1_blue.png',
        const Color.fromARGB(255, 0, 129, 39):
            'assets/images/clothes/tshirts/tshirt1_green.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt1_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '3',
      price: 200,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: const Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/dress/dress1_black.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/dress/dress1_black.png',
        Color.fromARGB(255, 121, 121, 121):
            'assets/images/clothes/dress/dress1_grey.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '4',
      price: 220,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: const Color.fromARGB(255, 26, 0, 121),
      selectedImage: 'assets/images/clothes/pants/pants1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 26, 0, 121):
            'assets/images/clothes/pants/pants1_blue.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants1_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '5',
      price: 300,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt1_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt1_red.png',
        const Color(0xffA4A4A4): 'assets/images/clothes/shirts/shirt1_grey.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt1_black.png',
        const Color.fromARGB(255, 243, 137, 187):
            'assets/images/clothes/shirts/shirt1_pink.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '6',
      price: 360,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt1_blue.png',
        const Color.fromARGB(255, 0, 129, 39):
            'assets/images/clothes/tshirts/tshirt1_green.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt1_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '7',
      price: 400,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 136, 130, 130),
      selectedImage: 'assets/images/clothes/dress/dress1_black.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 14, 11, 11):
            'assets/images/clothes/dress/dress1_black.png',
        const Color.fromARGB(255, 136, 130, 130):
            'assets/images/clothes/dress/dress1_grey.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '8',
      price: 470,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 26, 0, 121),
      selectedImage: 'assets/images/clothes/pants/pants1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 26, 0, 121):
            'assets/images/clothes/pants/pants1_blue.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants1_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '9',
      price: 500,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt1_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt1_red.png',
        const Color(0xffA4A4A4): 'assets/images/clothes/shirts/shirt1_grey.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt1_black.png',
        const Color.fromARGB(255, 243, 137, 187):
            'assets/images/clothes/shirts/shirt1_pink.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '10',
      price: 540,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt1_blue.png',
        const Color.fromARGB(255, 0, 129, 39):
            'assets/images/clothes/tshirts/tshirt1_green.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt1_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '11',
      price: 600,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 136, 130, 130),
      selectedImage: 'assets/images/clothes/dress/dress1_black.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 14, 11, 11):
            'assets/images/clothes/dress/dress1_black.png',
        const Color.fromARGB(255, 136, 130, 130):
            'assets/images/clothes/dress/dress1_grey.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '12',
      price: 640,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 26, 0, 121),
      selectedImage: 'assets/images/clothes/pants/pants1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 26, 0, 121):
            'assets/images/clothes/pants/pants1_blue.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants1_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '13',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt1_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt1_red.png',
        const Color(0xffA4A4A4): 'assets/images/clothes/shirts/shirt1_grey.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt1_black.png',
        const Color.fromARGB(255, 243, 137, 187):
            'assets/images/clothes/shirts/shirt1_pink.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '14',
      price: 100,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt1_blue.png',
        const Color.fromARGB(255, 0, 129, 39):
            'assets/images/clothes/tshirts/tshirt1_green.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt1_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '15',
      price: 119,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 136, 130, 130),
      selectedImage: 'assets/images/clothes/dress/dress1_black.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 14, 11, 11):
            'assets/images/clothes/dress/dress1_black.png',
        const Color.fromARGB(255, 136, 130, 130):
            'assets/images/clothes/dress/dress1_grey.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '16',
      price: 180,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 26, 0, 121),
      selectedImage: 'assets/images/clothes/pants/pants1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 26, 0, 121):
            'assets/images/clothes/pants/pants1_blue.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants1_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '17',
      price: 200,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt1_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt1_red.png',
        const Color(0xffA4A4A4): 'assets/images/clothes/shirts/shirt1_grey.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt1_black.png',
        const Color.fromARGB(255, 243, 137, 187):
            'assets/images/clothes/shirts/shirt1_pink.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '18',
      price: 127,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt1_blue.png',
        const Color.fromARGB(255, 0, 129, 39):
            'assets/images/clothes/tshirts/tshirt1_green.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt1_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '19',
      price: 200,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 136, 130, 130),
      selectedImage: 'assets/images/clothes/dress/dress1_black.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 14, 11, 11):
            'assets/images/clothes/dress/dress1_black.png',
        const Color.fromARGB(255, 136, 130, 130):
            'assets/images/clothes/dress/dress1_grey.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '20',
      price: 300,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 26, 0, 121),
      selectedImage: 'assets/images/clothes/pants/pants1_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 26, 0, 121):
            'assets/images/clothes/pants/pants1_blue.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants1_light_blue.png',
      },
    ),
  ];

  static final List<ProductModel> topTrending = [
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '21',
      price: 320,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt2_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt2_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt2_blue.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt2_black.png',
        const Color.fromARGB(255, 247, 148, 0):
            'assets/images/clothes/shirts/shirt2_orange.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '22',
      price: 320,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 214, 4, 4),
      selectedImage: 'assets/images/clothes/tshirts/tshirt2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt2_blue.png',
        const Color.fromARGB(255, 255, 145, 0):
            'assets/images/clothes/tshirts/tshirt2_orange.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt2_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '23',
      price: 200,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress2_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '24',
      price: 100,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '25',
      price: 120,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt2_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt2_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt2_blue.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt2_black.png',
        const Color.fromARGB(255, 247, 148, 0):
            'assets/images/clothes/shirts/shirt2_orange.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '26',
      price: 170,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt2_blue.png',
        const Color.fromARGB(255, 255, 145, 0):
            'assets/images/clothes/tshirts/tshirt2_orange.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt2_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '27',
      price: 120,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress2_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '28',
      price: 140,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '29',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt2_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt2_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt2_blue.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt2_black.png',
        const Color.fromARGB(255, 247, 148, 0):
            'assets/images/clothes/shirts/shirt2_orange.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '30',
      price: 260,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 255, 145, 0),
      selectedImage: 'assets/images/clothes/tshirts/tshirt2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt2_blue.png',
        const Color.fromARGB(255, 255, 145, 0):
            'assets/images/clothes/tshirts/tshirt2_orange.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt2_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '31',
      price: 400,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress2_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '32',
      price: 500,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '33',
      price: 600,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt2_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt2_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt2_blue.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt2_black.png',
        const Color.fromARGB(255, 247, 148, 0):
            'assets/images/clothes/shirts/shirt2_orange.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '34',
      price: 700,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt2_blue.png',
        const Color.fromARGB(255, 255, 145, 0):
            'assets/images/clothes/tshirts/tshirt2_orange.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt2_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '35',
      price: 800,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress2_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '36',
      price: 230,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '37',
      price: 100,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt2_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt2_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt2_blue.png',
        const Color.fromARGB(255, 3, 3, 3):
            'assets/images/clothes/shirts/shirt2_black.png',
        const Color.fromARGB(255, 247, 148, 0):
            'assets/images/clothes/shirts/shirt2_orange.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '38',
      price: 600,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt2_blue.png',
        const Color.fromARGB(255, 255, 145, 0):
            'assets/images/clothes/tshirts/tshirt2_orange.png',
        const Color.fromARGB(255, 214, 4, 4):
            'assets/images/clothes/tshirts/tshirt2_red.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '39',
      price: 200,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress2_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress2_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '40',
      price: 800,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
  ];

  static final List<ProductModel> featuredProducts = [
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '41',
      price: 100,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt3_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt3_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt3_blue.png',
        const Color.fromARGB(255, 6, 155, 25):
            'assets/images/clothes/shirts/shirt3_green.png',
        const Color.fromARGB(255, 0, 247, 33):
            'assets/images/clothes/shirts/shirt3_light_green.png',
        const Color.fromARGB(255, 1, 82, 19):
            'assets/images/clothes/shirts/shirt3_dark_green.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '42',
      price: 100,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt3_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt3_blue.png',
        const Color.fromARGB(255, 146, 100, 39):
            'assets/images/clothes/tshirts/tshirt3_brown.png',
        const Color.fromARGB(255, 247, 247, 247):
            'assets/images/clothes/tshirts/tshirt3_white.png',
        const Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/tshirts/tshirt3_black.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '43',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress4_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress4_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '44',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '45',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt3_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt3_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt3_blue.png',
        const Color.fromARGB(255, 6, 155, 25):
            'assets/images/clothes/shirts/shirt3_green.png',
        const Color.fromARGB(255, 0, 247, 33):
            'assets/images/clothes/shirts/shirt3_light_green.png',
        const Color.fromARGB(255, 1, 82, 19):
            'assets/images/clothes/shirts/shirt3_dark_green.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '46',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt3_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt3_blue.png',
        const Color.fromARGB(255, 146, 100, 39):
            'assets/images/clothes/tshirts/tshirt3_brown.png',
        const Color.fromARGB(255, 247, 247, 247):
            'assets/images/clothes/tshirts/tshirt3_white.png',
        const Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/tshirts/tshirt3_black.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '47',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress4_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress4_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '48',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '49',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt3_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt3_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt3_blue.png',
        const Color.fromARGB(255, 6, 155, 25):
            'assets/images/clothes/shirts/shirt3_green.png',
        const Color.fromARGB(255, 0, 247, 33):
            'assets/images/clothes/shirts/shirt3_light_green.png',
        const Color.fromARGB(255, 1, 82, 19):
            'assets/images/clothes/shirts/shirt3_dark_green.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '50',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt3_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt3_blue.png',
        const Color.fromARGB(255, 146, 100, 39):
            'assets/images/clothes/tshirts/tshirt3_brown.png',
        const Color.fromARGB(255, 247, 247, 247):
            'assets/images/clothes/tshirts/tshirt3_white.png',
        const Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/tshirts/tshirt3_black.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '51',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress4_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress4_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '52',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '53',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt3_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt3_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt3_blue.png',
        const Color.fromARGB(255, 6, 155, 25):
            'assets/images/clothes/shirts/shirt3_green.png',
        const Color.fromARGB(255, 0, 247, 33):
            'assets/images/clothes/shirts/shirt3_light_green.png',
        const Color.fromARGB(255, 1, 82, 19):
            'assets/images/clothes/shirts/shirt3_dark_green.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '54',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt3_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt3_blue.png',
        const Color.fromARGB(255, 146, 100, 39):
            'assets/images/clothes/tshirts/tshirt3_brown.png',
        const Color.fromARGB(255, 247, 247, 247):
            'assets/images/clothes/tshirts/tshirt3_white.png',
        const Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/tshirts/tshirt3_black.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '55',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress4_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress4_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '56',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.shirt,
      productName: 'Curved Shirts',
      id: '57',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color(0xffFF0000),
      selectedImage: 'assets/images/clothes/shirts/shirt3_red.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color(0xffFF0000): 'assets/images/clothes/shirts/shirt3_red.png',
        const Color.fromARGB(255, 38, 5, 156):
            'assets/images/clothes/shirts/shirt3_blue.png',
        const Color.fromARGB(255, 6, 155, 25):
            'assets/images/clothes/shirts/shirt3_green.png',
        const Color.fromARGB(255, 0, 247, 33):
            'assets/images/clothes/shirts/shirt3_light_green.png',
        const Color.fromARGB(255, 1, 82, 19):
            'assets/images/clothes/shirts/shirt3_dark_green.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.tshirt,
      productName: 'H&M T-Shirts',
      id: '58',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/tshirts/tshirt3_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        const Color.fromARGB(255, 43, 5, 177):
            'assets/images/clothes/tshirts/tshirt3_blue.png',
        const Color.fromARGB(255, 146, 100, 39):
            'assets/images/clothes/tshirts/tshirt3_brown.png',
        const Color.fromARGB(255, 247, 247, 247):
            'assets/images/clothes/tshirts/tshirt3_white.png',
        const Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/tshirts/tshirt3_black.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.dress,
      productName: 'Fasion Dress',
      id: '59',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 43, 5, 177),
      selectedImage: 'assets/images/clothes/dress/dress4_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 16, 0, 161):
            'assets/images/clothes/dress/dress4_blue.png',
      },
    ),
    ProductModel(
      categoryName: CategoryName.pants,
      productName: 'Curved Hem Shirts',
      id: '60',
      price: 199,
      description:
          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      selectedImage: 'assets/images/clothes/pants/pants2_light_blue.png',
      backGroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorImage: {
        Color.fromARGB(255, 0, 0, 0):
            'assets/images/clothes/pants/pants2_black.png',
        const Color.fromARGB(255, 137, 204, 243):
            'assets/images/clothes/pants/pants2_light_blue.png',
      },
    ),
  ];
}
