<!DOCTYPE html>
<html lang="{{ page.lang }}">
{{ partial('partial/head') }}
<body class="{% if is_home() %}home{% endif %}">
  <div id="container">
    {% if is_home() %}<div class="with-background">{% endif %}
    {{ partial('partial/header') }}
    <header id="banner" class="wrapper">
      <div class="inner">
        <h2 id="banner-title">{{ page.subtitle }}</h2>
        <div id="banner-start">
        </div>
        <div id="banner-share">{{ partial('partial/share') }}</div>
      </div>
    </header>
    </div>
    {{ body }}
  </div>
  {{ partial('partial/footer') }}
  <div id="mobile-nav-dimmer"></div>
  {{ partial('partial/mobile_nav') }}
  {{ partial('partial/after_footer') }}
</body>
</html>