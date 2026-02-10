import 'package:developeros/features/projects/views/widgets/features_tab.dart';
import 'package:developeros/features/projects/views/widgets/gallery_tab.dart';
import 'package:developeros/features/projects/views/widgets/overview_tab.dart';
import 'package:developeros/features/projects/views/widgets/timeline_tab.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import '../models/project_model.dart';

class ProjectDetailsView extends StatefulWidget {
  final Project project;

  const ProjectDetailsView({super.key, required this.project});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Header Section
          _buildHeader(context),
          const SizedBox(height: 24),

          // Tab Bar
          _buildTabBar(context),
          const SizedBox(height: 24),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                GalleryTab(project: widget.project),
                OverviewTab(project: widget.project),
                FeaturesTab(project: widget.project),
                TimelineTab(project: widget.project),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF3584E4),
              image: DecorationImage(
                image: AssetImage(widget.project.imageUrl),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'v1.0.0 • Public Repository',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                ),
              ],
            ),
          ),
          if (widget.project.demoUrl != null)
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.open_in_new, size: 18),
              label: const Text('Live Demo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white10,
                foregroundColor: Colors.white,
              ),
            ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.star_border, size: 18),
            label: Text('Star ${widget.project.metrics?.stars ?? 0}'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white10,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Clone'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3584E4),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: const Color(0xFF3584E4),
            borderRadius: BorderRadius.circular(10),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(icon: Icon(Icons.photo_library), text: 'Gallery'),
            Tab(icon: Icon(Icons.info_outline), text: 'Overview'),
            Tab(icon: Icon(Icons.extension), text: 'Features'),
            Tab(icon: Icon(Icons.timeline), text: 'Timeline'),
          ],
        ),
      ),
    );
  }
}
