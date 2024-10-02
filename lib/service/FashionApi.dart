
import 'package:dio/dio.dart';
import 'package:fashion_get/model/FashionModel.dart';

Future<List<DressModel>> getDataOfDress() async {
  Dio request = Dio();

  Response response = await request.get(
    "https://66f98bbaafc569e13a9917d3.mockapi.io/dress/Dress",
  );
  List<DressModel> fashion = [];

  for (var i = 0; i < response.data.length; i++) {
    DressModel dres = DressModel.fromMap(
      response.data[i],
    );
    fashion.add(dres);
  }
  return fashion;
}
