defmodule Mailman.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :recipient, :string
      add :subject, :string
      add :content, :string

      timestamps()
    end

  end
end
