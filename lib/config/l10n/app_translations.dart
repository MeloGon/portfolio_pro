import 'package:portfolio/presentation/providers/state.dart';

class AppTranslations {
  const AppTranslations(this.language);

  final AppLanguage language;

  bool get isSpanish => language == AppLanguage.es;

  String get localeLabel => isSpanish ? 'ES' : 'EN';
  String get otherLocaleLabel => isSpanish ? 'EN' : 'ES';
  String get heroEyebrow => isSpanish ? 'Mobile developer' : 'Mobile developer';
  String get heroTitle => isSpanish
      ? 'Flutter apps con foco en producto'
      : 'Product-minded Flutter apps';
  String get heroSubtitle => isSpanish
      ? 'Construyo experiencias moviles y web limpias, escalables y listas para usuarios reales.'
      : 'I build clean, scalable mobile and web experiences ready for real users.';
  String get about => isSpanish ? 'Sobre mi' : 'About';
  String get experience => isSpanish ? 'Experiencia' : 'Experience';
  String get projects => isSpanish ? 'Proyectos' : 'Projects';
  String get skills => isSpanish ? 'Habilidades' : 'Skills';
  String get education => isSpanish ? 'Educacion' : 'Education';
  String get contact => isSpanish ? 'Contacto' : 'Contact';
  String get available =>
      isSpanish ? 'Disponible para nuevos retos' : 'Available for new work';
  String get downloadCv => isSpanish ? 'Descargar CV' : 'Download CV';
  String get published => isSpanish ? 'Publicado' : 'Published';
  String get privateProject =>
      isSpanish ? 'Proyecto privado' : 'Private project';
  String get featuredWork => isSpanish ? 'Trabajo destacado' : 'Featured work';
  String get years => isSpanish ? '+6 años' : '6+ years';
  String get yearsLabel => isSpanish ? 'creando apps' : 'building apps';
  String get shipped => isSpanish ? '+10 apps' : '10+ apps';
  String get shippedLabel => isSpanish ? 'en produccion' : 'in production';
  String get platforms => isSpanish ? 'iOS Android Web' : 'iOS Android Web';
  String get platformsLabel => isSpanish ? 'plataformas' : 'platforms';
  String get lightMode => isSpanish ? 'Modo claro' : 'Light mode';
  String get darkMode => isSpanish ? 'Modo oscuro' : 'Dark mode';
  String get builtWith =>
      isSpanish ? 'Hecho con Flutter' : 'Built with Flutter';
  String get loading => isSpanish ? 'Cargando...' : 'Loading...';
  String get error => isSpanish ? 'Hay un problema' : 'Something went wrong';
}
