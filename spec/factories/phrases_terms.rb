# frozen_string_literal: true

FactoryBot.define do
  factory :phrases_term do
    # phrase { nil } # khi chau dung { nil } thi gia tri cua no luon la nil
    phrase # khi chau khong truyen proc nao, FactoryBot se su dung factory cung ten
    term
  end
end
