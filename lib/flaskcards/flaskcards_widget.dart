import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'flaskcards_model.dart';
export 'flaskcards_model.dart';

class FlaskcardsWidget extends StatefulWidget {
  const FlaskcardsWidget({
    Key? key,
    this.tema,
  }) : super(key: key);

  final TemasRecord? tema;

  @override
  _FlaskcardsWidgetState createState() => _FlaskcardsWidgetState();
}

class _FlaskcardsWidgetState extends State<FlaskcardsWidget> {
  late FlaskcardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlaskcardsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            widget.tema!.tema,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<List<FlashcardsRecord>>(
                    stream: queryFlashcardsRecord(
                      queryBuilder: (flashcardsRecord) => flashcardsRecord
                          .where('subject', isEqualTo: widget.tema?.tema),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<FlashcardsRecord>
                          swipeableStackFlashcardsRecordList = snapshot.data!;
                      return FlutterFlowSwipeableStack(
                        topCardHeightFraction: 0.7,
                        middleCardHeightFraction: 0.0,
                        bottomCardHeightFraction: 0.0,
                        topCardWidthFraction: 0.8,
                        middleCardWidthFraction: 0.0,
                        bottomCardWidthFraction: 0.0,
                        onSwipeFn: (index) {},
                        onLeftSwipe: (index) async {
                          final swipeableStackFlashcardsRecord =
                              swipeableStackFlashcardsRecordList[index];
                          _model.apiResultaz8 = await RequestNewCardCall.call(
                            pergunta: swipeableStackFlashcardsRecordList[index]
                                ?.question,
                            resposta: swipeableStackFlashcardsRecordList[index]
                                ?.answer,
                          );
                          if ((_model.apiResultaz8?.succeeded ?? true)) {
                            _model.lista = await actions.split(
                              RequestNewCardCall.perguntaResposta(
                                (_model.apiResultaz8?.jsonBody ?? ''),
                              ).toString(),
                            );

                            await RespostasRecord.collection.doc().set({
                              ...createRespostasRecordData(
                                resposta: RequestNewCardCall.perguntaResposta(
                                  (_model.apiResultaz8?.jsonBody ?? ''),
                                ).toString(),
                              ),
                              'lista': _model.lista,
                            });

                            await FlashcardsRecord.collection
                                .doc()
                                .set(createFlashcardsRecordData(
                                  deckId:
                                      swipeableStackFlashcardsRecordList[index]
                                          ?.deckId,
                                  goal:
                                      swipeableStackFlashcardsRecordList[index]
                                          ?.goal,
                                  subject:
                                      swipeableStackFlashcardsRecordList[index]
                                          ?.subject,
                                  subtopic:
                                      swipeableStackFlashcardsRecordList[index]
                                          ?.subtopic,
                                  question: _model.lista?.first,
                                  answer: _model.lista?.last,
                                  seedDeckId:
                                      swipeableStackFlashcardsRecordList[index]
                                          ?.deckId
                                          ?.toString(),
                                ));
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('chamada api'),
                                  content: Text(
                                      (_model.apiResultaz8?.statusCode ?? 200)
                                          .toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          setState(() {});
                        },
                        onRightSwipe: (index) {},
                        onUpSwipe: (index) {},
                        onDownSwipe: (index) {},
                        itemBuilder: (context, swipeableStackIndex) {
                          final swipeableStackFlashcardsRecord =
                              swipeableStackFlashcardsRecordList[
                                  swipeableStackIndex];
                          return FlipCard(
                            fill: Fill.fillBack,
                            direction: FlipDirection.HORIZONTAL,
                            speed: 400,
                            front: Container(
                              width: 148.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xF0897DF8),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  swipeableStackFlashcardsRecord.question,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ),
                            back: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xF0897DF8),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  swipeableStackFlashcardsRecord.answer,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: swipeableStackFlashcardsRecordList.length,
                        controller: _model.swipeableStackController,
                        enableSwipeUp: false,
                        enableSwipeDown: false,
                      );
                    },
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.swipeableStackController.triggerSwipeLeft();
                          },
                          child: FaIcon(
                            FontAwesomeIcons.thumbsDown,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 38.0,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.swipeableStackController.triggerSwipeRight();
                          },
                          child: FaIcon(
                            FontAwesomeIcons.thumbsUp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 38.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
