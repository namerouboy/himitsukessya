class RitualsController < ApplicationController
  # 関連テーブルはjoin書かなくてもincludesでまとめて取得できる
  # この際joinで繋げた1クエリではなくテーブル数分のクエリが実行される
  def index
    @rituals = Ritual.includes(
      :location,
      :ritual_steps,
      :artifacts, # 関連テーブルがidだけのテーブルで独自カラムがないなら中間テーブルを無視してよい
      ritual_offerings: :offering # id-quantityのように中間テーブルに独自のカラムがある場合は中間テーブル: :子テーブルの形にする
    )
  end

  def new
    @ritual = Ritual.new
    3.times { @ritual.ritual_steps.build }
    3.times { @ritual.ritual_offerings.build }
    3.times { @ritual.ritual_artifacts.build }
    @ritual.chants.build
    
    # これらはritualの親テーブルなので、build不要
    # @ritual.location.build
    # @ritual.cults.build
  end

  def create
    # 引数にparamsだけ指定すると怒られるので、必ずstrongparams用のメソッドを通す
    @ritual = Ritual.new(ritual_params)
    if @ritual.save
      redirect_to rituals_path
    else
      Rails.logger.debug @ritual.errors.full_messages
      render :new
    end
  end

  def ritual_params
    params.require(:ritual).permit(
      :title,
      :cult_id,
      :location_id,
      ritual_steps_attributes: [:id, :position, :description, :_destroy],
      chants_attributes: [:id, :content, :language, :_destroy],
      ritual_offerings_attributes: [:id, :offering_id, :quantity, :_destroy],
      ritual_artifacts_attributes: [:id, :artifact_id, :_destroy]
    )
  end
end