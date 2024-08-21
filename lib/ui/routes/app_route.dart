import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_manager/ui/navigation_page.dart';
import 'package:task_manager/ui/views/pages/createTask.dart';
import 'package:task_manager/ui/views/pages/home.dart';

const navigation = '/navigation';
const home = '/homepage';
const createTask = '/createTask';


List<GetPage> getPages = [
  GetPage(
    name: home,
    page: () => const HomePage(),

  ),
  GetPage(
    name: createTask,
    page: () => const CreateTask(),
  ),

  GetPage(
    name: navigation,
    page: () => NavigationPage(),
  ),

];