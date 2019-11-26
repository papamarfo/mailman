defmodule Mailman.Emails.Email do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emails" do
    field :content, :string
    field :recipient, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:recipient, :subject, :content])
    |> validate_required([:recipient, :subject, :content])
  end
end
