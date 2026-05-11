import SwiftUI
import MapKit

struct ContentView: View {
    let azerMaroon = Color(red: 138/255, green: 22/255, blue: 63/255)
    let lightBackground = Color(red: 248/255, green: 248/255, blue: 250/255)

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.2854, longitude: 51.5310),
        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    )

    var body: some View {
        ZStack {
            lightBackground
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    headerSection
                    savingsCard
                    discountsSection
                    mapSection
                    unlockProgressSection
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
        }
    }

    var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Student Deals & Rewards")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(azerMaroon)

            Text("Save more as you learn")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var savingsCard: some View {
        VStack(spacing: 14) {
            Text("Savings Score")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white.opacity(0.9))

            Text("125 QAR")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)
            
            Text("Goal: 200 QAR")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {

                    Capsule()
                        .fill(Color.white.opacity(0.3))
                        .frame(height: 8)

                    Capsule()
                        .fill(Color.white)
                        .frame(width: geo.size.width * 0.62, height: 8)
                }
            }
            .frame(height: 8)
            .padding(.horizontal, 20)

            Text("Level 2 • Student Saver")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white.opacity(0.9))

            Button(action: {}) {
                Text("Click to track your savings")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(azerMaroon)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .clipShape(Capsule())
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 28)
        .background(azerMaroon)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.12), radius: 10, x: 0, y: 6)
    }

    var discountsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Discount Categories")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)

            HStack(spacing: 12) {
                categoryItem(title: "Food", systemImage: "fork.knife")
                categoryItem(title: "Cafes", systemImage: "cup.and.saucer.fill")
                categoryItem(title: "Books", systemImage: "books.vertical.fill")
                categoryItem(title: "Tech", systemImage: "laptopcomputer")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    func categoryItem(title: String, systemImage: String) -> some View {
        VStack(spacing: 10) {
            Image(systemName: systemImage)
                .font(.system(size: 22))
                .foregroundColor(azerMaroon)

            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
    }

    var mapSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Closest Discounts")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)

            Map(coordinateRegion: $region)
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var unlockProgressSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Finish 3 more lessons to unlock more discounts")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 10)

                    Capsule()
                        .fill(azerMaroon)
                        .frame(width: geo.size.width * 0.65, height: 10)
                }
            }
            .frame(height: 10)
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    ContentView()
}
