Rails.application.routes.draw do
  # URLがどんどん深くなる必要があったらdoでネストしていくが、
  # 今回はroot/rituals/artifactsみたいなページは作らないのでこの一行だけでOK
  resources :rituals
end
