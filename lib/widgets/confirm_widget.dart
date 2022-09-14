import 'package:flutter/material.dart';

class ConfirmWidget extends StatelessWidget {
  final int cost;
  final VoidCallback function;
  final String description;
  const ConfirmWidget(
      this.function,
      this.cost,
      this.description,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        width: double.infinity,
        height: 210,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(15)
              ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      'سيتم خصم تكلفة هذه الخدمة من محفظتك',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$cost',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'ريال',
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    Text(
                      'رسوم : $description',
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: const Center(
                            child: Text(
                              'إلغاء',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: function,
                        child: Container(
                          child: const Center(
                            child: Text(
                              'موافق',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
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
