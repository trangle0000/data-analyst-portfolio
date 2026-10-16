
from pathlib import Path
import pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

# Project folders
project_dir = Path(__file__).resolve().parent.parent
data_dir = project_dir / "data"
charts_dir = project_dir / "charts"

charts_dir.mkdir(exist_ok=True)

# Read monthly sales data
df = pd.read_csv(data_dir / "monthly_sales.csv")

# Clean column names
df.columns = df.columns.str.strip().str.lower()

print(df.head())

# Create chart
plt.figure(figsize=(9, 5))

plt.bar(
    df["sales_month"],
    df["revenue"],
    color="#E8A0BF"
)

plt.title("Monthly Sales Revenue", fontsize=16)
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.grid(axis="y", alpha=0.2)

plt.tight_layout()

# Save chart
plt.savefig(
    charts_dir / "monthly_sales.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()

print("Chart saved: charts/monthly_sales.png")


# ==================================
# 2. SALES BY CATEGORY
# ==================================

category_df = pd.read_csv(
    data_dir / "sales_by_category.csv"
)

category_df.columns = (
    category_df.columns.str.strip().str.lower()
)

plt.figure(figsize=(9, 5))

plt.bar(
    category_df["category"],
    category_df["revenue"],
    color="#D8B4E2"
)

plt.title("Sales Revenue by Category", fontsize=16)
plt.xlabel("Product Category")
plt.ylabel("Revenue")
plt.grid(axis="y", alpha=0.2)

plt.tight_layout()

plt.savefig(
    charts_dir / "sales_by_category.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()

print("Chart saved: charts/sales_by_category.png")


# ==================================
# 3. TOP-SELLING PRODUCTS
# ==================================

top_df = pd.read_csv(
    data_dir / "top_selling_products.csv"
)

top_df.columns = top_df.columns.str.strip().str.lower()

top_df = top_df.sort_values(
    by="units_sold",
    ascending=True
)

plt.figure(figsize=(10, 6))

plt.barh(
    top_df["product_name"],
    top_df["units_sold"],
    color="#E8A0BF"
)

plt.title("Top-Selling Products", fontsize=16)
plt.xlabel("Units Sold")
plt.ylabel("Product")
plt.grid(axis="x", alpha=0.2)

plt.tight_layout()

plt.savefig(
    charts_dir / "top_selling_products.png",
    dpi=300,
    bbox_inches="tight"
)

plt.close()

print("Chart saved: charts/top_selling_products.png")


# ==================================
# 4. INVENTORY ANALYSIS
# ==================================

inventory_df = pd.read_csv(
    data_dir / "inventory_analysis.csv"
)

inventory_df.columns = (
    inventory_df.columns.str.strip().str.lower()
)

inventory_df = inventory_df.sort_values(
    by="stock_quantity",
    ascending=True
)

plt.figure(figsize=(11, 6))

plt.barh(
    inventory_df["product_name"],
    inventory_df["stock_quantity"],
    color="#E8A0BF",
    label="Current Stock"
)

plt.scatter(
    inventory_df["reorder_level"],
    inventory_df["product_name"],
    color="#805A8D",
    marker="D",
    label="Reorder Level",
    zorder=3
)

plt.title("Inventory Stock vs Reorder Level", fontsize=16)
plt.xlabel("Quantity")
plt.ylabel("Product")
plt.legend()
plt.grid(axis="x", alpha=0.2)

plt.tight_layout()

plt.savefig(
    charts_dir / "inventory_analysis.png",
    dpi=300,
    bbox_inches="tight"
)

plt.close()

print("Chart saved: charts/inventory_analysis.png")
