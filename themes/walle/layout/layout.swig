<!DOCTYPE html>
<html lang="{{ page.lang }}">
{{ partial('partial/head') }}
<body class="{% if is_home() %}home{% endif %}">
  <div id="container">
    {% if is_home() %}<div class="with-background" style="background-size: 100% 850px;">{% endif %}
    {{ partial('partial/header') }}
    {% if is_home() %}<header id="banner" class="wrapper">
      <div class="inner">
        <h2 id="banner-title">{{ site.data.index.subtitle }}</h2>
        <div id="banner-start">
        </div>
        <div id="banner-share">{{ partial('partial/share') }}</div>
      </div>
    </header>
    </div>
    {% endif %}
    {{ body }}
  </div>
  {{ partial('partial/footer') }}
  <div id="mobile-nav-dimmer"></div>
  {{ partial('partial/mobile_nav') }}
  {{ partial('partial/after_footer') }}
</body>
</html>