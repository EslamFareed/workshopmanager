import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_model.dart';
import 'package:workshopmanager/Feature/about_workshop/domain/repo/about_workshop_repo.dart';
import '../source/base/about_workshop_source.dart';

class AboutWorkshopRepoImpl implements AboutWorkshopRepo {
  final AboutWorkshopSource source;

  AboutWorkshopRepoImpl(this.source);
  @override
  Future<Either<Failure, AboutWorkshopModel>> showWorkshop(String id) async {
    try {
      final response = await source.showWorkshop(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        AboutWorkshopModel.fromJson(response['data'] as Map<String, dynamic>),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
