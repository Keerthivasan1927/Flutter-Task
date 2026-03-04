import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_sample_app/controllers/dashboard_controller.dart';
import 'package:my_sample_app/screens/favorite_screen.dart';
import 'package:my_sample_app/screens/submenu_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isEditMode = false;
  final GlobalKey _stackKey = GlobalKey();

  final Map<String, int> crossSpan = {};
  final Map<String, int> mainSpan = {};

  Map<String, int>? backupCross;
  Map<String, int>? backupMain;

  int? _draggingIndex;
  int? _hoverIndex;

  void startEdit() {
    final provider = context.read<DashboardController>();

    backupCross = Map.from(crossSpan);
    backupMain = Map.from(mainSpan);

    for (var menu in provider.dashboard!.menus) {
      crossSpan.putIfAbsent(menu.id, () => 1);
      mainSpan.putIfAbsent(menu.id, () => 1);
    }

    setState(() {
      isEditMode = true;
    });
  }

  void saveChanges() {
    setState(() {
      isEditMode = false;
      _draggingIndex = null;
      _hoverIndex = null;
    });
  }

  void cancelChanges() {
    setState(() {
      crossSpan
        ..clear()
        ..addAll(backupCross ?? {});
      mainSpan
        ..clear()
        ..addAll(backupMain ?? {});
      isEditMode = false;
      // ── NEW: reset drag state on cancel ──
      _draggingIndex = null;
      _hoverIndex = null;
    });
  }

  void _reorderMenus(int fromIndex, int toIndex) {
    if (fromIndex == toIndex) return;
    final provider = context.read<DashboardController>();
    final menus = provider.dashboard!.menus;

    // ── save span of dragged item ──
    final fromId = menus[fromIndex].id;
    final fromCross = crossSpan[fromId] ?? 1;
    final fromMain = mainSpan[fromId] ?? 1;

    // ── shift all spans between fromIndex and toIndex ──
    if (fromIndex < toIndex) {
      for (int i = fromIndex; i < toIndex; i++) {
        final currId = menus[i].id;
        final nextId = menus[i + 1].id;
        crossSpan[currId] = crossSpan[nextId] ?? 1;
        mainSpan[currId] = mainSpan[nextId] ?? 1;
      }
    } else {
      for (int i = fromIndex; i > toIndex; i--) {
        final currId = menus[i].id;
        final prevId = menus[i - 1].id;
        crossSpan[currId] = crossSpan[prevId] ?? 1;
        mainSpan[currId] = mainSpan[prevId] ?? 1;
      }
    }

    final toId = menus[toIndex].id;
    crossSpan[toId] = fromCross;
    mainSpan[toId] = fromMain;

    provider.reorderMenus(fromIndex, toIndex);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          if (isEditMode) ...[
            TextButton(onPressed: saveChanges, child: const Text("Save")),
            TextButton(onPressed: cancelChanges, child: const Text("Cancel")),
          ],
          IconButton(
            icon: const Icon(Icons.star, color: Colors.yellow),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              key: _stackKey,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: StaggeredGrid.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(provider.dashboard!.menus.length, (
                        index,
                      ) {
                        final menu = provider.dashboard!.menus[index];
                        final cross = crossSpan[menu.id] ?? 1;
                        final main = mainSpan[menu.id] ?? 1;

                        return StaggeredGridTile.count(
                          crossAxisCellCount: cross,
                          mainAxisCellCount: main,
                          child: isEditMode
                              ? DragTarget<int>(
                                  onWillAcceptWithDetails: (details) {
                                    if (_isExpanding) return false;
                                    if (details.data != index)
                                      setState(() => _hoverIndex = index);
                                    return details.data != index;
                                  },
                                  onLeave: (_) =>
                                      setState(() => _hoverIndex = null),
                                  onAcceptWithDetails: (details) {
                                    if (_isExpanding) return;
                                    setState(() => _hoverIndex = null);
                                    _reorderMenus(details.data, index);
                                  },
                                  builder: (context, candidateData, rejectedData) {
                                    final isHovered = _hoverIndex == index;
                                    return IgnorePointer(
                                      ignoring: _isExpanding,
                                      child: Draggable<int>(
                                        // dragAnchorStrategy:
                                        //     (draggable, context, position) {
                                        //       final renderObject =
                                        //           context.findRenderObject()
                                        //               as RenderBox;
                                        //       return renderObject.globalToLocal(
                                        //         position,
                                        //       );
                                        //     },
                                        data: index,
                                        onDragStarted: () => setState(() {
                                          print("yes drag started");
                                          _draggingIndex = index;
                                        }),
                                        onDragEnd: (_) => setState(
                                          () => _draggingIndex = null,
                                        ),
                                        onDraggableCanceled: (_, __) =>
                                            setState(
                                              () => _draggingIndex = null,
                                            ),
                                        childWhenDragging: Opacity(
                                          opacity: 0.3,
                                          child: buildTile(
                                            menu,
                                            index,
                                            useKey: false,
                                          ),
                                        ),
                                        feedback: Material(
                                          color: Colors.transparent,
                                          child: SizedBox(
                                            width: _isExpanding ? 0 : 100,
                                            height: _isExpanding ? 0 : 100,
                                            child: Transform.scale(
                                              scale: 1.05,
                                              child: Opacity(
                                                opacity: 0.9,
                                                child: buildTile(
                                                  menu,
                                                  index,
                                                  showExpandIcon: false,
                                                  useKey: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          child: buildTile(menu, index),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : buildTile(menu, index),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                if (_isExpanding &&
                    _expandTileOrigin != null &&
                    _expandPreviewSize != null)
                  Positioned(
                    left: _expandTileOrigin!.dx,
                    top: _expandTileOrigin!.dy,
                    child: IgnorePointer(
                      child: SizedBox(
                        width: _expandPreviewSize!.dx.clamp(
                          (MediaQuery.of(context).size.width - 24 - 20) / 3,
                          MediaQuery.of(context).size.width - 24,
                        ),
                        height: _expandPreviewSize!.dy.clamp(
                          (MediaQuery.of(context).size.width - 24 - 20) / 3,
                          MediaQuery.of(context).size.width - 24,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  provider.dashboard!.menus
                                      .firstWhere(
                                        (m) => m.id == _expandingMenuId,
                                        orElse: () =>
                                            provider.dashboard!.menus.first,
                                      )
                                      .name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // ── show the expand icon on the overlay too ──
                              const Positioned(
                                bottom: 6,
                                right: 6,
                                child: Icon(
                                  Icons.open_in_full,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  bool _isExpanding = false;
  final Map<String, GlobalKey> _tileKeys = {};

  String? _expandingMenuId;
  Offset? _expandPreviewSize;
  Offset? _expandTileOrigin;

  Widget buildTile(
    menu,
    int index, {
    bool showExpandIcon = true,
    bool useKey = true,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cellWidth = (screenWidth - 24 - 20) / 3;
    _tileKeys.putIfAbsent(menu.id, () => GlobalKey());

    return GestureDetector(
      onTap: () {
        if (!isEditMode) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SubMenuScreen(menu: menu, fromDashboard: true),
            ),
          );
        }
      },
      onLongPressStart: isEditMode
          ? null
          : (details) async {
              startEdit();
              final overlay =
                  Overlay.of(context).context.findRenderObject() as RenderBox;
              final selected = await showMenu(
                context: context,
                position: RelativeRect.fromRect(
                  Rect.fromPoints(
                    details.globalPosition,
                    details.globalPosition,
                  ),
                  Offset.zero & overlay.size,
                ),
                items: [
                  PopupMenuItem(
                    value: "favorite",
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: menu.isFavorite ? Colors.yellow : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(menu.isFavorite ? "Unstar" : "Favorite"),
                      ],
                    ),
                  ),
                ],
              );
              if (selected == "favorite") {
                context.read<DashboardController>().toggleFavorite(menu.id);
              }
            },
      child: Stack(
        children: [
          Container(
            key: useKey ? _tileKeys[menu.id] : null,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
              ],
            ),
            child: Center(
              child: Text(
                menu.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          if (menu.isFavorite)
            const Positioned(
              top: 6,
              right: 6,
              child: Icon(Icons.star, color: Colors.yellow, size: 20),
            ),

          if (isEditMode && showExpandIcon)
            Positioned(
              bottom: 6,
              right: 6,
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerDown: (event) {
                  _isExpanding = true;
                  final key = _tileKeys[menu.id];
                  final renderBox =
                      key?.currentContext?.findRenderObject() as RenderBox?;
                  if (renderBox == null) return;
                  final stackRenderBox =
                      _stackKey.currentContext?.findRenderObject()
                          as RenderBox?;
                  if (stackRenderBox == null) return;
                  final globalOrigin = renderBox.localToGlobal(Offset.zero);
                  final localOrigin = stackRenderBox.globalToLocal(
                    globalOrigin,
                  );
                  final localFinger = stackRenderBox.globalToLocal(
                    event.position,
                  );
                  final fingerX = (localFinger.dx - localOrigin.dx).clamp(
                    cellWidth,
                    cellWidth * 3,
                  );
                  final fingerY = (localFinger.dy - localOrigin.dy).clamp(
                    cellWidth,
                    cellWidth * 3,
                  );
                  setState(() {
                    _expandingMenuId = menu.id;
                    _expandTileOrigin = localOrigin;
                    _expandPreviewSize = Offset(fingerX, fingerY);
                  });
                },
                onPointerMove: (event) {
                  if (!_isExpanding || _expandTileOrigin == null) return;
                  final stackRenderBox =
                      _stackKey.currentContext?.findRenderObject()
                          as RenderBox?;
                  if (stackRenderBox == null) return;
                  final localFinger = stackRenderBox.globalToLocal(
                    event.position,
                  );
                  final fingerX = (localFinger.dx - _expandTileOrigin!.dx)
                      .clamp(cellWidth, cellWidth * 3);
                  final fingerY = (localFinger.dy - _expandTileOrigin!.dy)
                      .clamp(cellWidth, cellWidth * 3);
                  setState(() => _expandPreviewSize = Offset(fingerX, fingerY));
                },
                onPointerUp: (event) {
                  if (_expandTileOrigin == null) return;
                  final stackRenderBox =
                      _stackKey.currentContext?.findRenderObject()
                          as RenderBox?;
                  if (stackRenderBox == null) return;
                  final localFinger = stackRenderBox.globalToLocal(
                    event.position,
                  );
                  final fingerX = (localFinger.dx - _expandTileOrigin!.dx)
                      .clamp(cellWidth, cellWidth * 3);
                  final fingerY = (localFinger.dy - _expandTileOrigin!.dy)
                      .clamp(cellWidth, cellWidth * 3);
                  setState(() {
                    crossSpan[menu.id] = (fingerX / cellWidth).round().clamp(
                      1,
                      3,
                    );
                    mainSpan[menu.id] = (fingerY / cellWidth).round().clamp(
                      1,
                      3,
                    );
                    _isExpanding = false;
                    _expandingMenuId = null;
                    _expandTileOrigin = null;
                    _expandPreviewSize = null;
                  });
                },
                onPointerCancel: (_) {
                  setState(() {
                    _isExpanding = false;
                    _expandingMenuId = null;
                    _expandTileOrigin = null;
                    _expandPreviewSize = null;
                  });
                },
                child: const Icon(
                  Icons.open_in_full,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
