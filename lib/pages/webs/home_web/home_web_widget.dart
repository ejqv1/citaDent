import '/backend/backend.dart';
import '../../../flutter/flutter_flow_theme.dart';
import '../../../flutter/flutter_flow_util.dart';
import '../../../flutter/flutter_flow_widgets.dart';
import '/pages/webs/nav_bar_web/nav_bar_web_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_web_model.dart';
export 'home_web_model.dart';

class HomeWebWidget extends StatefulWidget {
  const HomeWebWidget({Key? key}) : super(key: key);

  @override
  _HomeWebWidgetState createState() => _HomeWebWidgetState();
}

class _HomeWebWidgetState extends State<HomeWebWidget> {
  late HomeWebModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeWebModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: wrapWithModel(
                  model: _model.navBarWebModel,
                  updateCallback: () => setState(() {}),
                  child: NavBarWebWidget(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('addDate');
                          },
                          text: 'Agregar',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: StreamBuilder<List<CitasRecord>>(
                                stream: queryCitasRecord(
                                  queryBuilder: (citasRecord) =>
                                      citasRecord.orderBy('fecha'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CitasRecord> listViewCitasRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewCitasRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewCitasRecord =
                                          listViewCitasRecordList[
                                              listViewIndex];
                                      return Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          extentRatio: 0.25,
                                          children: [
                                            SlidableAction(
                                              label: 'Eliminar',
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              icon: FontAwesomeIcons
                                                  .solidTrashAlt,
                                              onPressed: (_) async {
                                                await listViewCitasRecord
                                                    .reference
                                                    .delete();
                                              },
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            listViewCitasRecord.motivo,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          subtitle: Text(
                                            dateTimeFormat('M/d h:mm a',
                                                listViewCitasRecord.fecha!),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                          trailing: Icon(
                                            Icons.check_box,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 20.0,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          dense: false,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
