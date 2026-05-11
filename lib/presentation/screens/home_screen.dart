import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/l10n/app_translations.dart';
import 'package:portfolio/presentation/providers/state.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _educationKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 620),
      curve: Curves.easeOutCubic,
      alignment: .08,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppTranslations(ref.watch(languageModeProvider));
    final maxWidth = MediaQuery.sizeOf(context).width >= 1180 ? 1120.0 : 920.0;
    final horizontalPadding = MediaQuery.sizeOf(context).width < 700
        ? 20.0
        : 40.0;

    final navItems = [
      NavItem(t.about),
      NavItem(t.experience),
      NavItem(t.projects),
      NavItem(t.skills),
      NavItem(t.education),
    ];

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KeyedSubtree(
                            key: _aboutKey,
                            child: const PortfolioHero(),
                          ),
                          KeyedSubtree(
                            key: _experienceKey,
                            child: SectionShell(
                              title: t.experience,
                              kicker: t.featuredWork,
                              child: const ExperienceTilesWidget(),
                            ),
                          ),
                          KeyedSubtree(
                            key: _projectsKey,
                            child: SectionShell(
                              title: t.projects,
                              delay: const Duration(milliseconds: 80),
                              child: const ProjectsSectionWidget(),
                            ),
                          ),
                          KeyedSubtree(
                            key: _skillsKey,
                            child: SectionShell(
                              title: t.skills,
                              delay: const Duration(milliseconds: 140),
                              child: const SkillsWidget(),
                            ),
                          ),
                          KeyedSubtree(
                            key: _educationKey,
                            child: SectionShell(
                              title: t.education,
                              delay: const Duration(milliseconds: 200),
                              child: const EducationWidget(),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Text(t.builtWith),
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
          PortfolioNavbar(
            items: navItems,
            onItemTap: (index) {
              final keys = [
                _aboutKey,
                _experienceKey,
                _projectsKey,
                _skillsKey,
                _educationKey,
              ];
              _scrollTo(keys[index]);
            },
          ),
        ],
      ),
    );
  }
}
