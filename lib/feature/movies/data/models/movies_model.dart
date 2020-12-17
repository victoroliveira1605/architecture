import 'package:clean_architecture_movie/feature/movies/data/models/dates_model.dart';
import 'package:clean_architecture_movie/feature/movies/data/models/result._model.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/movies.dart';
import 'package:flutter/material.dart';

class MoviesModel extends Movies {
  MoviesModel({
    @required results,
    @required page,
    @required totalResults,
    @required dates,
    @required totalPages,
  }) : super(
            results: results,
            page: page,
            totalResults: totalResults,
            dates: dates,
            totalPages: totalPages);

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
        page: json["page"],
        totalResults: json["total_results"],
        dates: DatesModel.fromJson(json["dates"]),
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() {
    List<Map> _results = this.results != null
        ? this.results.map((i) => i.toJson()).toList()
        : null;
    return {
      "results": _results,
      "page": page,
      "total_results": totalResults,
      "dates": dates.toJson(),
      "total_pages": totalPages,
    };
  }
}
