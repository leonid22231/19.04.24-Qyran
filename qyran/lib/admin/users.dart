import 'package:flutter/material.dart';
import 'package:qyran/api/entity/CourseEntity.dart';
import 'package:qyran/api/entity/UserEntity.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:searchable_listview/searchable_listview.dart';

class UsersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return CusstomScaffold(
        title: S.of(context).users,
        body: FutureBuilder(
          future: api().findAllUsers(),
          builder: (context, snapshot) {
            return SearchableList<UserEntity>(
              inputDecoration: InputDecoration(
                  labelText: S.of(context).search_by_number,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              filter: (value) => snapshot.data!
                  .where(
                    (element) => element.phone.toLowerCase().contains(value),
                  )
                  .toList(),
              initialList: snapshot.data!,
              itemBuilder: (user) => Column(
                children: [
                  _userView(user),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            );
          },
        ));
  }

  CourseEntity? _selectCourse(BuildContext context, List<CourseEntity> list) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).enter_course),
          content: SingleChildScrollView(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, list[index]);
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Ink(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text("${index + 1} ${list[index].name}"),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1.h,
                  );
                },
                itemCount: list.length),
          ),
          actions: [
            TextButton(
              child: Text(S.of(context).cansel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((value) {
      return value;
    });
  }

  void _showAlertDialog(BuildContext context, UserEntity user) {
    List<CourseEntity> userC = [];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${user.name} ${user.surname}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).user_courses),
                FutureBuilder(
                    future: api().findUserCourses(user.id),
                    builder: (_, snapshot) {
                      userC = snapshot.data!;
                      return ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return Text(
                                "${index + 1}. ${snapshot.data![index].name}");
                          },
                          separatorBuilder: (_, __) {
                            return SizedBox(
                              height: 1.h,
                            );
                          },
                          itemCount: snapshot.data!.length);
                    }),
                SizedBox(
                  height: 1.h,
                ),
                TextButton(
                    onPressed: () async {
                      List<CourseEntity> getAv =
                          await api().findAvailableCourses(user.id);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(S.of(context).enter_course),
                            content: SingleChildScrollView(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(context, getAv[index]);
                                      },
                                      borderRadius: BorderRadius.circular(15),
                                      child: Ink(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                            "${index + 1} ${getAv[index].name}"),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 1.h,
                                    );
                                  },
                                  itemCount: getAv.length),
                            ),
                            actions: [
                              TextButton(
                                child: Text(S.of(context).cansel),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        if (value != null) {
                          api().addSub(user.phone, value.id);
                        }
                      });
                    },
                    child: Text(S.of(context).user_add_course)),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(S.of(context).enter_course),
                            content: SingleChildScrollView(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(context, userC[index]);
                                      },
                                      borderRadius: BorderRadius.circular(15),
                                      child: Ink(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                            "${index + 1} ${userC[index].name}"),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 1.h,
                                    );
                                  },
                                  itemCount: userC.length),
                            ),
                            actions: [
                              TextButton(
                                child: Text(S.of(context).cansel),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        if (value != null) {
                          api().deleteSub(user.phone, value.id);
                        }
                      });
                    },
                    child: Text(S.of(context).user_delete_course))
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(S.of(context).cansel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _userView(UserEntity user) {
    return InkWell(
      onTap: () {
        _showAlertDialog(context, user);
      },
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.network(
                    teacherPhotoUrl(user.id),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Text("${user.name} ${user.surname}"),
            Text("+${user.phone}"),
            Text(user.email)
          ],
        ),
      ),
    );
  }
}
