@extends('layouts.app')

@section('title', __('product.list'))

@section('content')
    <div class="pull-right">
        {{ link_to_route('products.price-list', __('product.print_price_list'), [], ['class' => 'btn btn-info', 'target' => '_blank']) }}
        {{ link_to_route('products.index', __('product.create'), ['action' => 'create'], ['class' => 'btn btn-success']) }}
        {{ link_to_route('products.index', __('product.import'), ['action' => 'import'], ['class' => 'btn btn-primary']) }}
    </div>
    <h3 class="page-header">
        {{ __('product.list') }}
        <small>{{ __('app.total') }} : {{ $products->total() }} {{ __('product.product') }}</small>
    </h3>

    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default table-responsive">
                <div class="panel-heading">

                    {{ Form::open(['method' => 'get', 'class' => 'form-inline']) }}
                    {!! FormField::text('q', ['value' => request('q'), 'label' => __('product.search'), 'class' => 'input-sm']) !!}
                    {{ Form::submit(__('product.search'), ['class' => 'btn btn-sm']) }}
                    {{ link_to_route('products.index', __('app.reset')) }}
                    <span id="del-selected"> |
                        <a href="javascript:void(0);" class="text-danger" id="btn-delete"> Delete Selected</a>
                    </span>
                    {{ Form::close() }}
                </div>

                <form action="{{ route('product.deletes') }}" method="post" id="form-delete">
                    @csrf
                </form>

                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th class="text-center">{{ __('app.table_no') }}</th>
                            <th>{{ __('product.name') }}</th>
                            <th>{{ __('product.unit') }}</th>
                            <th class="text-right">{{ __('product.cash_price') }}</th>
                            <th class="text-center">{{ __('app.action') }}</th>
                            <th class="text-center">
                                <input id="check-all" type="checkbox">
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $customersTotal = 0; ?>
                        @foreach ($products as $key => $product)
                            <tr>
                                <td class="text-center">{{ $products->firstItem() + $key }}</td>
                                <td>{{ $product->name }}</td>
                                <td>{{ $product->unit->name }}</td>
                                <td class="text-right">{{ format_rp($product->cash_price) }}</td>
                                <td class="text-center">
                                    {!! link_to_route('products.index', __('app.edit'), ['action' => 'edit', 'id' => $product->id] + request(['page', 'q']), ['id' => 'edit-product-' . $product->id]) !!} |
                                    {!! link_to_route('products.index', __('app.delete'), ['action' => 'delete', 'id' => $product->id] + request(['page', 'q']), ['id' => 'del-product-' . $product->id]) !!}
                                </td>
                                <td class="text-center">
                                    <input class="check" type="checkbox" form="form-delete" name="id[]"
                                        value="{{ $product->id }}">
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="panel-body">{{ $products->appends(Request::except('page'))->render() }}</div>
            </div>
        </div>
        <div class="col-md-4">
            @include('products.partials.forms')
        </div>
    </div>
@endsection

@push('ext_js')
    <script>
        $(function() {
            $('#check-all').on('click', function() {
                if (this.checked) {
                    $('.check').prop("checked", true);
                } else {
                    $('.check').prop("checked", false);
                }
            })

            $("#btn-delete").click(function() { // Ketika user mengklik tombol delete
                var confirm = window.confirm(
                    "Are you sure to delete this selected data?"); // Buat sebuah alert konfirmasi

                if (confirm) // Jika user mengklik tombol "Ok"
                    $("#form-delete").submit(); // Submit form
            });
        })

    </script>
@endpush
