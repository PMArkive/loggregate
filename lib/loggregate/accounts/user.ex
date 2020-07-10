defmodule Loggregate.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :steamid, :string
    field :name, :string
    field :admin, :boolean
    has_many :acl, Loggregate.Accounts.ACLEntry, references: :steamid, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:steamid, :name, :admin])
    |> validate_required([:steamid, :name, :admin])
    |> unique_constraint(:steamid)
  end
end
