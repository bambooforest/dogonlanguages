<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "parameters" %>
<%block name="title">${_('Parameter')} ${ctx.name}</%block>

<h2>${ctx.name}</h2>

% if ctx.description:
<p>${ctx.description}</p>
% endif

% for chunk in [ctx._files[i:i + 3] for i in range(0, len(ctx._files), 3)]:
<div class="row-fluid" id="images">
% for f in chunk:
    <div class="span4">
        <div class="well">
            <img src="${request.file_url(f)}" class="image"/>
        </div>
    </div>
% endfor
</div>
<hr/>
% endfor

% if map_ or request.map:
${(map_ or request.map).render()}
% endif

${request.get_datatable('values', h.models.Value, parameter=ctx).render()}