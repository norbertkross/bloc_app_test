import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';

class UserRowWidget extends StatelessWidget {
  const UserRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text(
                    "Hello Shmuel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 30,
                    child: Stack(
                      children: [
                        
                        Icon(Icons.notifications_none,color: Theme.of(context).disabledColor,),
                  
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff22C55E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),             
            ],
          );
        },
      ),
    );
  }
}
