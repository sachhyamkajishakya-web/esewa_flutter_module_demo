# esewa_flutter_module

Flutter module for add to app in the native android and ios app.

## Getting Started

Pre-requisities
Make sure that your Flutter Version and dart version is 3.41.2  and 3.11.0 respectively.

You flutter sdk should be installed in the folder which can be accessed without any permission issues.

Once you have all these follow these steps and you should be good to go.

1. Create a root folder anmed (esewa_demo_app).
2. Create two sub-folder titled as esewa_native_applications and esewa_flutter_module.
3. Clone this repo inside the esewa_flutter_module.
4. Once it is clone, the current branch should be the main branch.
5. Stay in the main branch and in the root esewa_flutter_module directory.
6. From there run these commands in sequence - flutter clean -> flutter pub get -> dart run build_runner build -d
7. These should intall all required dependencies and auto-generated files.


**Note:** You must find env directory inside lib directory. Create three different files with names .env.dev, .env.stg and .env.prod

Within these files please add this key-value 

BASE_URL=https://fakestoreapi.com/

Paste the same base url for all three files. Later on real application base url could be different based on the envirnment but for the sake of this demo, app base url is the same.

Run  **dart run build_runner build -d** again. This should generate three files with names env_dev.g.dart, env_staging.g.dart and env_production.g.dart.


   
