defmodule LiveViewStudio.VolunteerTest do
  use LiveViewStudio.DataCase

  alias LiveViewStudio.Volunteer

  describe "volunteers" do
    alias LiveViewStudio.Volunteer.Volunteers

    @valid_attrs %{checked_out: true, name: "some name", phone: "some phone"}
    @update_attrs %{checked_out: false, name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{checked_out: nil, name: nil, phone: nil}

    def volunteers_fixture(attrs \\ %{}) do
      {:ok, volunteers} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Volunteer.create_volunteers()

      volunteers
    end

    test "list_volunteers/0 returns all volunteers" do
      volunteers = volunteers_fixture()
      assert Volunteer.list_volunteers() == [volunteers]
    end

    test "get_volunteers!/1 returns the volunteers with given id" do
      volunteers = volunteers_fixture()
      assert Volunteer.get_volunteers!(volunteers.id) == volunteers
    end

    test "create_volunteers/1 with valid data creates a volunteers" do
      assert {:ok, %Volunteers{} = volunteers} = Volunteer.create_volunteers(@valid_attrs)
      assert volunteers.checked_out == true
      assert volunteers.name == "some name"
      assert volunteers.phone == "some phone"
    end

    test "create_volunteers/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Volunteer.create_volunteers(@invalid_attrs)
    end

    test "update_volunteers/2 with valid data updates the volunteers" do
      volunteers = volunteers_fixture()
      assert {:ok, %Volunteers{} = volunteers} = Volunteer.update_volunteers(volunteers, @update_attrs)
      assert volunteers.checked_out == false
      assert volunteers.name == "some updated name"
      assert volunteers.phone == "some updated phone"
    end

    test "update_volunteers/2 with invalid data returns error changeset" do
      volunteers = volunteers_fixture()
      assert {:error, %Ecto.Changeset{}} = Volunteer.update_volunteers(volunteers, @invalid_attrs)
      assert volunteers == Volunteer.get_volunteers!(volunteers.id)
    end

    test "delete_volunteers/1 deletes the volunteers" do
      volunteers = volunteers_fixture()
      assert {:ok, %Volunteers{}} = Volunteer.delete_volunteers(volunteers)
      assert_raise Ecto.NoResultsError, fn -> Volunteer.get_volunteers!(volunteers.id) end
    end

    test "change_volunteers/1 returns a volunteers changeset" do
      volunteers = volunteers_fixture()
      assert %Ecto.Changeset{} = Volunteer.change_volunteers(volunteers)
    end
  end
end
