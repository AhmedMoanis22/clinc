import 'package:clinc/core/helper/shared_prefrences.dart';
import 'package:clinc/core/helper/spacing.dart';
import 'package:clinc/features/home/data/model/home_model.dart';
import 'package:clinc/features/home/ui/widget/home_screen_title.dart';
import 'package:clinc/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/classes/doctor_images.dart';

import '../../../core/theming/style.dart';
import '../../../core/classes/categories_list.dart';
import '../logic/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Hi, ${MySharedPreferences.getString('username')}! ',
                        style: TextStyles.font18Black700Weight,
                      ),
                      subtitle: const Text('How Are you Today?'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset('assets/image/notification.png'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Image.asset('assets/image/Banner.png',
                        width: 390, fit: BoxFit.fitWidth),
                    verticalSpacing(15),
                    const HomeScreenTitle(
                      title: 'Doctor Speciality',
                    ),
                    verticalSpacing(10),
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      CategoriesList.categories[index].image!),
                                  horizentalSpacing(10),
                                ],
                              ),
                              verticalSpacing(10),
                              Text('${CategoriesList.categories[index].title}'),
                            ],
                          );
                        },
                        itemCount: CategoriesList.categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                      ),
                    ),
                    verticalSpacing(10),
                    const HomeScreenTitle(
                      title: 'Recommendation Doctor',
                    ),
    
                    
                    SizedBox(
                      height: 300,
                      child: BlocBuilder<HomeCubit,LoginState<HomeModel>>(
                        builder: (BuildContext context, state) { 
                          return state.when(initial: ()
                          {
                            return const Center(child: CircularProgressIndicator());
                          }, loading: ()
                          {
     return const Center(child: CircularProgressIndicator());
                          }, success: (HomeModel homeModel)
                          {
                            return ListView.separated(
                          separatorBuilder: (context,index)
                          {
                            return verticalSpacing(10);
                              
                          },
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  DoctorImages.doctorimage[index],
                                  width: 150,
                                  height: 200,
                                  fit:BoxFit.fitWidth,
                                 
                                ),
                              ],
                            );
                          },
                          
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: DoctorImages.doctorimage.length,
                        );
                     
    
                          }, error: (error)
                          {
                            return Text(
                              '${error}'
                            );
    
                          });
                         },
                        
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
