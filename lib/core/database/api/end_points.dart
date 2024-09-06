class EndPointsAPI {
  static const String baseUrl = "https://food-api-omega.vercel.app/api/v1/";

//! --------------------------------- Chef --------------------------------
  //! post in Chef
  static const String signUpChef = 'chef/signup';
  static const String signInChef = 'chef/signin';
  static const String checkEmailChef = 'chef/check-email';
  static const String sendCodeChef = 'chef/send-code';
  //! patch in Chef
  static const String changePasswordChef = 'chef/change-password';
  static const String changeForgottenPasswordChef =
      'chef/change-forgotten-password';
  static const String updateChefChef = 'chef/update';
  static const String changeChefStatusChef = 'chef/change-chef-status';
  //! delete in Chef
  static const String deleteAccountChef = 'chef/delete?id=';
  //! get in Chef
  static const String getChefDataChef = 'chef/get-chef/';
  static const String logOutChef = 'chef/logout';
  // static const String getChefData = 'chef/get-chef'; // get all chef data meals

//! --------------------------------- Methods in Chef --------------------------------

//! get Chef by id
  static String getChefById(String id) => '$getChefDataChef$id';

//! delete Chef in Chef by id
  static String deleteChefById(String id) => '$deleteAccountChef$id';

//! --------------------------------- Admin --------------------------------
  //! post in Admin
  static const String signInAdmin = 'admin/signin';
  static const String dealWithChefRequestAdmin = 'admin/deal-with-chef-request';
  static const String dealWithMealRequestAdmin = 'admin/deal-with-meal-request';
  //! get in Admin
  static const String getMealsAdmin = 'admin/get-meals';
  static const String getChefsAdmin = 'admin/get-chefs';
  static const String logOutAdmin = 'admin/logout';

//! --------------------------------- Meal --------------------------------
  //! post in Meal
  static const String addMeal = 'meal/add-to-menu';
  //! get in Meal
  static const String getMeals = 'meal/get-meals';
  //! patch in Meal
  static const String updateMeal = 'chef/update-meal/';
  //! delete in Meal
  static const String deleteMeal = 'meal/delete-meal/';

//! --------------------------------- Methods in Meal --------------------------------
//! update meal by id
  static String updateMealById(String id) => '$updateMeal$id';

//! delete meal by id
  static String deleteMealById(String id) => '$deleteMeal$id';
}

//!----------------------------------- Keys in Chef --------------------------------
class APIKeys {
  static const String email = 'email';
  static const String password = 'password';
}
