import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../controllers/projects_controller.dart';
import 'project_details_view.dart';
import '../../desktop/controllers/window_manager.dart';
import 'widgets/sidebar_item.dart';
import 'widgets/folder_item.dart';
import 'widgets/new_folder_item.dart';
import 'widgets/file_item.dart';

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
              const SidebarItem(icon: Icons.schedule, label: 'Recent'),
              const SidebarItem(icon: Icons.star_border, label: 'Starred'),
              const SidebarItem(icon: Icons.home_filled, label: 'Home'),
              const SidebarItem(
                icon: Icons.folder_open,
                label: 'Projects',
                isSelected: true,
              ),
              const SidebarItem(icon: Icons.code, label: 'Development'),
              const SidebarItem(icon: Icons.brush, label: 'Design'),
              const SidebarItem(icon: Icons.person_outline, label: 'Personal'),
              const Spacer(),
              const SidebarItem(icon: Icons.delete_outline, label: 'Trash'),
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
                            return const NewFolderItem();
                          }
                          final project = controller.projects[index];
                          return FolderItem(
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
                                  size: const Size(
                                    1000,
                                    700,
                                  ), // Larger size for rich content
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
                          FileItem(
                            icon: Icons.description,
                            label: 'Resume_2023.pdf',
                            color: Colors.redAccent,
                          ),
                          FileItem(
                            icon: Icons.info_outline,
                            label: 'README.md',
                            color: Colors.blueAccent,
                          ),
                          FileItem(
                            icon: Icons.image,
                            label: 'header_bg.jpg',
                            color: Colors.purpleAccent,
                          ),
                          FileItem(
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
