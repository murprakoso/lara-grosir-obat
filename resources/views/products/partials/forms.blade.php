@inject('unit', 'App\Unit')
@if (Request::get('action') == 'create')
    {!! Form::open(['route' => 'products.store']) !!}
    {!! FormField::text('name', ['label' => __('product.name'), 'required' => true]) !!}
    <div class="row">
        <div class="col-md-12">{!! FormField::price('cash_price', ['label' => __('product.cash_price'), 'required' => true]) !!}</div>
    </div>
    {!! FormField::select('unit_id', $unit->pluck('name', 'id'), ['label' => __('product.unit'), 'required' => true]) !!}
    {!! Form::submit(__('product.create'), ['class' => 'btn btn-success']) !!}
    {{ link_to_route('products.index', __('app.cancel'), [], ['class' => 'btn btn-default']) }}
    {!! Form::close() !!}
@endif
@if (Request::get('action') == 'import')
    <span>Format import
        <a href="{{ route('format-import') }}"> download <i class="fa fa-download"></i></a>
    </span><br>
    {!! Form::open(['route' => 'products.import', 'files' => true]) !!}
    {!! FormField::select('unit_id', $unit->pluck('name', 'id'), ['label' => __('product.unit'), 'required' => true]) !!}
    <div class="form-group required ">
        <label for="file" class="control-label">{{ __('product.file') }}</label>&nbsp;
        {!! Form::file('file', ['class' => 'form-control', 'required' => true, 'accept' => '.xlsx,.xls']) !!}
    </div>
    {!! Form::submit(__('product.import'), ['class' => 'btn btn-primary']) !!}
    {{ link_to_route('products.index', __('app.cancel'), [], ['class' => 'btn btn-default']) }}
    {!! Form::close() !!}
@endif
@if (Request::get('action') == 'edit' && $editableProduct)
    {!! Form::model($editableProduct, ['route' => ['products.update', $editableProduct->id], 'method' => 'patch']) !!}
    {!! FormField::text('name', ['label' => __('product.name'), 'required' => true]) !!}
    <div class="row">
        <div class="col-md-12">{!! FormField::price('cash_price', ['label' => __('product.cash_price'), 'required' => true]) !!}</div>
    </div>
    {!! FormField::select('unit_id', $unit->pluck('name', 'id'), ['label' => __('product.unit'), 'required' => true]) !!}
    @if (request('q'))
        {{ Form::hidden('q', request('q')) }}
    @endif
    @if (request('page'))
        {{ Form::hidden('page', request('page')) }}
    @endif
    {!! Form::submit(__('product.update'), ['class' => 'btn btn-success']) !!}
    {{ link_to_route('products.index', __('app.cancel'), Request::only('q'), ['class' => 'btn btn-default']) }}
    {!! Form::close() !!}
@endif
@if (Request::get('action') == 'delete' && $editableProduct)
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">{{ __('product.delete') }}</h3>
        </div>
        <div class="panel-body">
            <table class="table table-condensed">
                <tbody>
                    <tr>
                        <th>{{ __('product.name') }}</th>
                        <td>{{ $editableProduct->name }}</td>
                    </tr>
                    <tr>
                        <th>{{ __('product.unit') }}</th>
                        <td>{{ $editableProduct->unit->name }}</td>
                    </tr>
                    <tr>
                        <th>{{ __('product.cash_price') }}</th>
                        <td>{{ format_rp($editableProduct->cash_price) }}</td>
                    </tr>
                </tbody>
            </table>
            <hr>
            {{ __('product.delete_confirm') }}
        </div>
        <div class="panel-footer">
            {!! FormField::delete(['route' => ['products.destroy', $editableProduct->id]], __('app.delete_confirm_button'), ['class' => 'btn btn-danger'], ['product_id' => $editableProduct->id, 'page' => request('page'), 'q' => request('q')]) !!}
            {{ link_to_route('products.index', __('app.cancel'), Request::only('q'), ['class' => 'btn btn-default']) }}
        </div>
    </div>
@endif
