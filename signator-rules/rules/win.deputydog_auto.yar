rule win_deputydog_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.deputydog."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.deputydog"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 2bd0 ff74240c 2bf2 56 ff7108 }
            // n = 5, score = 100
            //   2bd0                 | sub                 edx, eax
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   2bf2                 | sub                 esi, edx
            //   56                   | push                esi
            //   ff7108               | push                dword ptr [ecx + 8]

        $sequence_1 = { 50 ffd7 83c410 8d852cfdffff 50 8d8524fbffff }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   83c410               | add                 esp, 0x10
            //   8d852cfdffff         | lea                 eax, [ebp - 0x2d4]
            //   50                   | push                eax
            //   8d8524fbffff         | lea                 eax, [ebp - 0x4dc]

        $sequence_2 = { 7523 8b45f4 8b35???????? ff30 ffd6 8b45f8 ff30 }
            // n = 7, score = 100
            //   7523                 | jne                 0x25
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b35????????         |                     
            //   ff30                 | push                dword ptr [eax]
            //   ffd6                 | call                esi
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   ff30                 | push                dword ptr [eax]

        $sequence_3 = { 8d85fcfeffff 50 c645f365 e8???????? 83c40c 50 8b45e4 }
            // n = 7, score = 100
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax
            //   c645f365             | mov                 byte ptr [ebp - 0xd], 0x65
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   50                   | push                eax
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]

        $sequence_4 = { ff15???????? 85c0 7509 8b8574ffffff 8945f0 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7509                 | jne                 0xb
            //   8b8574ffffff         | mov                 eax, dword ptr [ebp - 0x8c]
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax

        $sequence_5 = { 6a00 56 ff7604 50 ff15???????? 8365f000 6800200000 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff7604               | push                dword ptr [esi + 4]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8365f000             | and                 dword ptr [ebp - 0x10], 0
            //   6800200000           | push                0x2000

        $sequence_6 = { 8b7e08 8d1419 397d08 7417 8bc2 2bc1 2bc3 }
            // n = 7, score = 100
            //   8b7e08               | mov                 edi, dword ptr [esi + 8]
            //   8d1419               | lea                 edx, [ecx + ebx]
            //   397d08               | cmp                 dword ptr [ebp + 8], edi
            //   7417                 | je                  0x19
            //   8bc2                 | mov                 eax, edx
            //   2bc1                 | sub                 eax, ecx
            //   2bc3                 | sub                 eax, ebx

        $sequence_7 = { 6a10 8d45b8 53 50 e8???????? }
            // n = 5, score = 100
            //   6a10                 | push                0x10
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { 8845bc ff15???????? 8d45bc c645fc04 50 8d45dc 50 }
            // n = 7, score = 100
            //   8845bc               | mov                 byte ptr [ebp - 0x44], al
            //   ff15????????         |                     
            //   8d45bc               | lea                 eax, [ebp - 0x44]
            //   c645fc04             | mov                 byte ptr [ebp - 4], 4
            //   50                   | push                eax
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax

        $sequence_9 = { c9 c20800 b8???????? e8???????? 83ec58 8a450f 53 }
            // n = 7, score = 100
            //   c9                   | leave               
            //   c20800               | ret                 8
            //   b8????????           |                     
            //   e8????????           |                     
            //   83ec58               | sub                 esp, 0x58
            //   8a450f               | mov                 al, byte ptr [ebp + 0xf]
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 90112
}