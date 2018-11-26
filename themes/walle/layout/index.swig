<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
    <ul id="intro-feature-list">
      <li class="intro-feature-wrap">
          <div class="intro-feature"><div class="intro-feature-icon"><i class="fa fa-code"></i></div>
          <h3 class="intro-feature-title">稳定的上线</h3>
          </div>
          <p class="intro-feature-desc"> 支持多项目、多环境一键部署上线，一键快速回滚</p>
      </li>
      <li class="intro-feature-wrap">
          <div class="intro-feature"><div class="intro-feature-icon"><i class="fa fa-cogs"></i></div>
          <h3 class="intro-feature-title">清晰的记录</h3>
          </div>
          <p class="intro-feature-desc">上线单申请、审核、部署、实时操作日志。</p>
      </li>
      <li class="intro-feature-wrap">
          <div class="intro-feature"><div class="intro-feature-icon"><i class="fa fa-book"></i></div>
          <h3 class="intro-feature-title">多任务插件</h3>
          </div>
          <p class="intro-feature-desc"> pre-deploy、post-deploy、pre-release、post-release。</p>
      </li>
      <li class="intro-feature-wrap">
          <div class="intro-feature"><div class="intro-feature-icon"><i class="fa fa-bolt"></i></div>
          <h3 class="intro-feature-title">完整的功能支持</h3>
          </div>
          <p class="intro-feature-desc">权限、通知、文件指纹。</p>
      </li>
      </ul>
      <div id="intro-get-started-wrap">
        <a href="{{ url_for_lang('docs') }}" id="intro-get-started-link">{{ __('index.get_started') }}</a>
      </div>
    </div>
  </div>
  {{ partial('partial/detail') }}
  {{ partial('partial/user') }}
  {{ partial('partial/contact') }}
</div>