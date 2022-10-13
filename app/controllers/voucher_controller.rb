class VoucherController < ApplicationController  
    
    def index 
        @vouchers = Voucher.all
        @voucher = Voucher.new
    end

    def create
        @voucher = Voucher.new(voucher_params)
        if @voucher.save
            flash[:success] = 'Voucher has been create'
            redirect_to root_path
        else
            flash[:warning] = "Cannot create vouch er!!"
            redirect_to root_path
        end
    end

    def destroy
        Voucher.find(params[:id]).destroy
        flash[:success] = "Voucher detroy"
    end

    private

    def voucher_params    
        params.permit(:name, :per)
    end

end