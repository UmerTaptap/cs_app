import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cs_app/core/custom/sizes/paddings.dart';
import 'package:cs_app/core/custom/themes/app_colors.dart';
import 'package:cs_app/core/custom/themes/custom_colors.dart';
import 'package:cs_app/core/globals/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../core/globals/blocs/theme/theme_bloc.dart';
import '../../../core/globals/message.dart';
import '../bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 0,top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppImages.waChumpLogo, width: 60, height: 60,),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('WAC', style: Theme.of(context).textTheme.labelMedium),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.circle, color: Colors.green, size: 8),
                              4.pw,
                              Text('Online', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),

                      // dropdown popup menu
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                print('Light Theme');
                                context.read<ThemeBloc>().add(ThemeChanged(isDark: false));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  context.read<ThemeBloc>().state is ThemeLight ?
                                  const Icon(Icons.circle, color: Colors.green, size: 8) :
                                  Container(),
                                  4.pw,
                                  Text('Light Theme', style: Theme.of(context).textTheme.labelSmall,),
                                ],
                              ),
                            ),

                            PopupMenuItem(
                              onTap: () {
                                print('Dark Theme');
                                context.read<ThemeBloc>().add(ThemeChanged(isDark: true));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  context.read<ThemeBloc>().state is ThemeDark ?
                                  const Icon(Icons.circle, color: Colors.green, size: 8) :
                                  Container(),
                                  4.pw,
                                  Text('Dark Theme', style: Theme.of(context).textTheme.labelSmall,),
                                ],
                              ),
                            ),
                          ];
                        },
                      ),


                    ],
                  ),
                ),

                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          AppImages.waChumpLogo,
                          height: 450,
                          opacity: const AlwaysStoppedAnimation(0.05),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          state.messages.isEmpty ?
                          const Expanded(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('No messages yet, start chatting!'),
                                ],
                              ),
                            ),
                          ) :

                          Expanded(
                            child: ListView.builder(
                              controller: _scrollController,
                              reverse: true,
                              itemCount: state.messages.length,
                              itemBuilder: (context, index) {
                                var message = state.messages.reversed.toList()[index];
                                return message.isMe ?
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        BubbleSpecialThree(
                                          text: message.text,
                                          color: Theme.of(context).primaryColor,
                                          tail: true,
                                          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                                          delivered: message.isDelivered,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Text(
                                            DateFormat('hh:mm a').format(DateTime.parse(message.time)),
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ) :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BubbleSpecialThree(
                                          text: message.text,
                                          color: Theme.of(context).extension<CustomColors>()!.chatBubbleColor,
                                          tail: true,
                                          isSender: false,
                                          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                                          delivered: message.isDelivered,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Text(
                                            DateFormat('hh:mm a').format(DateTime.parse(message.time)),
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),


                          (state is HomeBotTypingStart) ?
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Bot is typing...'),
                              ],
                            ),
                          ) :
                          const SizedBox(),

                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _textController,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                                    cursorColor: Colors.black38,
                                    decoration: InputDecoration(
                                      hintText: 'Type a message',
                                      filled: true,
                                      fillColor: Theme.of(context).extension<CustomColors>()!.chatBubbleColor,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black54),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),

                                    ),
                                  ),
                                ),

                                8.pw,

                                IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                                  ),
                                  onPressed: (){
                                    if(_textController.text.isNotEmpty) {
                                      context.read<HomeBloc>().add(FetchGptResponse(_textController.text));
                                      _textController.clear();
                                    }else{
                                      showMessage('Please enter a message');
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_upward_rounded, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
