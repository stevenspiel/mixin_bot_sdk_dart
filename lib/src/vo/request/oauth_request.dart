import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'oauth_request.g.dart';

@JsonSerializable()
class OauthRequest with EquatableMixin {
  OauthRequest(this.clientId, this.clientSecret, this.code);

  factory OauthRequest.fromJson(Map<String, dynamic> json) =>
      _$OauthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OauthRequestToJson(this);

  @JsonKey(name: 'client_id')
  String clientId;
  @JsonKey(name: 'client_secret')
  String clientSecret;
  @JsonKey(name: 'code')
  String code;

  @override
  List<Object?> get props => [clientId, clientSecret, code];
}
