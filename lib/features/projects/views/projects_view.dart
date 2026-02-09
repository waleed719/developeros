import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/projects_controller.dart';
import '../models/project_model.dart';
import 'project_details_view.dart';
import '../../desktop/controllers/window_manager.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  String? _selectedProjectId;

  @override
  Widget build(BuildContext context) {
    final controller = sl<ProjectsController>();

    return Row(
      children: [
        // Sidebar
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.2),
            border: Border(
              right: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _SidebarItem(icon: Icons.schedule, label: 'Recent'),
              _SidebarItem(icon: Icons.star_border, label: 'Starred'),
              _SidebarItem(icon: Icons.home_filled, label: 'Home'),
              _SidebarItem(
                icon: Icons.folder_open,
                label: 'Projects',
                isSelected: true,
              ),
              _SidebarItem(icon: Icons.code, label: 'Development'),
              _SidebarItem(icon: Icons.brush, label: 'Design'),
              _SidebarItem(icon: Icons.person_outline, label: 'Personal'),
              const Spacer(),
              _SidebarItem(icon: Icons.delete_outline, label: 'Trash'),
              const SizedBox(height: 16),
            ],
          ),
        ),

        // Main Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs / Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.white54,
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white54,
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'Home / Projects',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: Colors.white12),

              // Grid
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Folders',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount:
                            controller.projects.length +
                            1, // +1 for "New Folder"
                        itemBuilder: (context, index) {
                          if (index == controller.projects.length) {
                            return _NewFolderItem();
                          }
                          final project = controller.projects[index];
                          return _FolderItem(
                            project: project,
                            isSelected: _selectedProjectId == project.title,
                            onTap: () {
                              setState(() {
                                _selectedProjectId = project.title;
                              });
                            },
                            onDoubleTap: () {
                              setState(() {
                                _selectedProjectId = project.title;
                              });
                              sl<WindowManager>().openWindow(
                                WindowEntry(
                                  id: 'project_details_${project.title}',
                                  title: project.title,
                                  icon: Icons.folder_special,
                                  content: ProjectDetailsView(project: project),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Files',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 6,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                        children: const [
                          _FileItem(
                            icon: Icons.description,
                            label: 'Resume_2023.pdf',
                            color: Colors.redAccent,
                          ),
                          _FileItem(
                            icon: Icons.info_outline,
                            label: 'README.md',
                            color: Colors.blueAccent,
                          ),
                          _FileItem(
                            icon: Icons.image,
                            label: 'header_bg.jpg',
                            color: Colors.purpleAccent,
                          ),
                          _FileItem(
                            icon: Icons.settings,
                            label: 'config.json',
                            color: Colors.grey,
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
      ],
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _SidebarItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 20,
          color: isSelected ? Colors.white : Colors.white70,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        dense: true,
        horizontalTitleGap: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onTap: () {},
      ),
    );
  }
}

class _FolderItem extends StatelessWidget {
  final Project project;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  const _FolderItem({
    required this.project,
    required this.isSelected,
    required this.onTap,
    required this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF3584E4) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.folder, size: 64, color: Color(0xFF3584E4)),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                project.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              project.tags.isNotEmpty ? project.tags.first : 'Project',
              style: const TextStyle(fontSize: 10, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewFolderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add_circle_outline, size: 48, color: Colors.white30),
          SizedBox(height: 8),
          Text(
            'New Folder',
            style: TextStyle(color: Colors.white30, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _FileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _FileItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
