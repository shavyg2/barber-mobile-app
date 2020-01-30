/// <reference path="..\user\user.d.ts" />
// GENERATED CODE - DO NOT MODIFY BY HAND
declare module 'mobile_app' {
  interface LoginResponse {
    token?: string;
    user?: User;
  }
  interface SignupResponse {
    message?: string;
    token?: string;
    user?: User;
  }
  interface User {
    email?: string;
    username?: string;
  }
}