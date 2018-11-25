<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
      {{ page.content }}
      <div id="intro-get-started-wrap">
        <a href="{{ url_for_lang('docs') }}" id="intro-get-started-link">{{ __('index.get_started') }}</a>
      </div>
    </div>
  </div>
  {{ partial('partial/detail') }}
  {{ partial('partial/user') }}
  {{ partial('partial/contact') }}
</div>