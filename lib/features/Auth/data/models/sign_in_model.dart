import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
	final String? token;

	const SignInModel({this.token});

	factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
				token: json['token'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'token': token,
			};

	@override
	List<Object?> get props => [token];
}
