defmodule MailmanWeb.PageController do
  use MailmanWeb, :controller

  alias Mailman.Emails
  alias Mailman.Emails.Email

  def index(conn, _params) do
    emails = Emails.list_emails()
    render(conn, "index.html", emails: emails)
  end

  def new(conn, _params) do
    changeset = Emails.change_email(%Email{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"email" => email_params}) do
    case Emails.create_email(email_params) do
      {:ok, email} ->
        Emails.send_email(email.recipient, email.subject, email.content)
        |> Mailman.Mailer.deliver_now() # Send the email
        conn
        |> put_flash(:info, "Email sent.")
        |> redirect(to: Routes.page_path(conn, :show, email))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    email = Emails.get_email!(id)
    render(conn, "show.html", email: email)
  end

  def delete(conn, %{"id" => id}) do
    email = Emails.get_email!(id)
    {:ok, _email} = Emails.delete_email(email)

    conn
    |> put_flash(:info, "Email deleted successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end